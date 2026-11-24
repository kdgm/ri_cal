module RiCal
  class Component
    #- ©2009 Rick DeNatale, All rights reserved. Refer to the file README.txt for the license
    #
    # to see the property accessing methods for this class see the RiCal::Properties::Calendar module
    class Calendar < Component
      include RiCal::CalendarOccurrences
      include RiCal::Properties::Calendar

      attr_reader :tz_source #:nodoc:

      def initialize(parent=nil,entity_name = nil, &init_block) #:nodoc:
        @tz_source = 'TZINFO' # Until otherwise told
        super
      end

      def self.entity_name #:nodoc:
        "VCALENDAR"
      end

      def tz_info_source? #:nodoc:
        @tz_source == 'TZINFO'
      end

      def required_timezones # :nodoc:
        @required_timezones ||=  RequiredTimezones.new
      end

      def subcomponent_class # :nodoc:
        {
          :event => Event,
          :todo  => Todo,
          :journal => Journal,
          :freebusy => Freebusy,
          :timezone => Timezone,
        }
      end

      def export_properties_to(export_stream) # :nodoc:
        prodid_property.params["X-RICAL-TZSOURCE"] = @tz_source if @tz_source
        export_prop_to(export_stream, "PRODID", prodid_property)
        export_prop_to(export_stream, "CALSCALE", calscale_property)
        export_prop_to(export_stream, "VERSION", version_property)
        export_prop_to(export_stream, "METHOD", method_property)
      end

      def prodid_property_from_string(line) # :nodoc:
        result = super
        @tz_source = prodid_property.params["X-RICAL-TZSOURCE"]
        result
      end

      # Return the default time zone identifier for this calendar
      def default_tzid
        @default_tzid || PropertyValue::DateTime.default_tzid
      end

      # Set the default time zone identifier for this calendar
      # To set the default to floating times use a value of :floating
      def default_tzid=(value)
        @default_tzid=value
      end

      # return an array of event components contained within this Calendar
      def events
        subcomponents["VEVENT"]
      end

      # add an event to the calendar
      def add_subcomponent(component)
        super(component)
        component.add_date_times_to(required_timezones) if tz_info_source?
      end

      # return an array of todo components contained within this Calendar
      def todos
        subcomponents["VTODO"]
      end

      # return an array of journal components contained within this Calendar
      def journals
        subcomponents["VJOURNAL"]
      end

      # return an array of freebusy components contained within this Calendar
      def freebusys
        subcomponents["VFREEBUSY"]
      end

      class TimezoneID #:nodoc:
        attr_reader :identifier, :calendar
        def initialize(identifier, calendar)
          self.identifier, self.calendar = identifier, calendar
        end

        def tzinfo_timezone
          nil
        end

        def resolved
          calendar.find_timezone(identifier)
        end

        def local_to_utc(local)
          resolved.local_to_utc(date_time_prop)
        end
      end

      # return an array of timezone components contained within this calendar
      def timezones
        subcomponents["VTIMEZONE"]
      end

      class TZInfoWrapper #:nodoc:
        attr_reader :tzinfo, :calendar #:nodoc:
        def initialize(tzinfo, calendar) #:nodoc:
          @tzinfo = tzinfo
          @calendar = calendar
        end

        def identifier #:nodoc:
          tzinfo.identifier
        end

        def local_date_time(ruby_time, tzid) #:nodoc:
          RiCal::PropertyValue::DateTime.new(calendar, :value => ruby_time.strftime("%Y%m%dT%H%M%S"), :params => {'TZID' => tzid})
        end

        def utc_date_time(ruby_time) #:nodoc
            RiCal::PropertyValue::DateTime.new(calendar, :value => ruby_time.strftime("%Y%m%dT%H%M%SZ"))
        end

        # Converts a local date-time to UTC. A local time that a DST change skips, e.g. 02:30
        # when the clocks jump from 02:00 to 03:00, moves forward by the skipped hour, as
        # ActiveSupport does. A local time that a DST change repeats resolves to its first,
        # daylight saving, occurrence unless TZInfo::Timezone.default_dst says otherwise.
        def local_to_utc(local) #:nodoc:
          local_time = local.to_ri_cal_ruby_value
          utc_date_time(tzinfo.local_to_utc(existing_local_time(local_time), dst_for_ambiguous_local_time))
        end

        def utc_to_local(local) #:nodoc:
          local_date_time(tzinfo.utc_to_local(local.to_ri_cal_ruby_value), tzinfo.identifier)
        end

        # The UTC offset that converts a local time to the same moment as #local_to_utc, so
        # for a local time that a DST change skips, the offset from before the change.
        def rational_utc_offset(local)
          existing_local = existing_local_time(local)
          offset_seconds = tzinfo.period_for_local(existing_local, dst_for_ambiguous_local_time).utc_total_offset
          RiCal.RationalOffset[offset_seconds - seconds_between(local, existing_local)]
        end

        # The number of seconds by which #local_to_utc moves a local date-time forward because
        # a DST change skips its local time, or 0 for a local time that exists.
        def skipped_seconds(local) #:nodoc:
          local_time = local.to_ri_cal_ruby_value
          seconds_between(local_time, existing_local_time(local_time))
        end

        private

        ONE_HOUR = Rational(1, 24)

        def existing_local_time(local_time)
          local_time += ONE_HOUR while tzinfo.periods_for_local(local_time).empty?
          local_time
        end

        def seconds_between(earlier_time, later_time)
          ((later_time - earlier_time) * 86400).round
        end

        def dst_for_ambiguous_local_time
          TZInfo::Timezone.default_dst.nil? ? true : TZInfo::Timezone.default_dst
        end
      end

      def find_timezone(identifier)  #:nodoc:
        if tz_info_source?
          begin
            TZInfoWrapper.new(TZInfo::Timezone.get(identifier), self)
          rescue ::TZInfo::InvalidTimezoneIdentifier => ex
            raise RiCal::InvalidTimezoneIdentifier.invalid_tzinfo_identifier(identifier)
          end
        else
          result = timezones.find {|tz| tz.tzid == identifier}
          raise RiCal::InvalidTimezoneIdentifier.not_found_in_calendar(identifier) unless result
          result
        end
      end

      def export_required_timezones(export_stream) # :nodoc:
        required_timezones.export_to(export_stream)
      end

      class FoldingStream #:nodoc:
        attr_reader :stream #:nodoc:
        def initialize(stream) #:nodoc:
          @stream = stream || StringIO.new
        end

        def string #:nodoc:
          stream.string
        end

        def utf8_safe_split(string, n)
          if string.bytesize <= n
            [string, nil]
          else
            bytes = string.bytes.to_a
            while (128..191).include?(bytes[n])
              n = n - 1
            end
            before = bytes[0,n]
            after = bytes[n..-1]
            [before.pack("C*").force_encoding("utf-8"), after.empty? ? nil : after.pack("C*").force_encoding("utf-8")]
          end
        end

        def valid_utf8?(string)
          string.unpack("U") rescue nil
        end

        def fold(string) #:nodoc:
          line, remainder = *utf8_safe_split(string, 73)
          stream.puts(line)
          while remainder
            line, remainder = *utf8_safe_split(remainder, 72)
            stream.puts(" #{line}")
          end
        end

        def puts(*strings) #:nodoc:
          strings.each do |string|
            string.split("\n").each do |line|
              fold(line)
            end
          end
        end
      end

      # Export this calendar as an iCalendar file.
      # if to is nil (the default) then this method will return a string,
      # otherwise to should be an IO to which the iCalendar file contents will be written
      def export(to=nil)
        export_stream = FoldingStream.new(to)
        export_stream.puts("BEGIN:VCALENDAR")
        export_properties_to(export_stream)
        export_x_properties_to(export_stream)
        export_required_timezones(export_stream)
        export_subcomponent_to(export_stream, events)
        export_subcomponent_to(export_stream, todos)
        export_subcomponent_to(export_stream, journals)
        export_subcomponent_to(export_stream, freebusys)
        subcomponents.each do |key, value|
          unless %{VEVENT VTODO VJOURNAL VFREEBUSYS}.include?(key)
            export_subcomponent_to(export_stream, value)
          end
        end
        export_stream.puts("END:VCALENDAR")
        if to
          nil
        else
          export_stream.string
        end
      end

      alias_method :export_to, :export

    end
  end
end
