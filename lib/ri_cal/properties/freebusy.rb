module RiCal
  module Properties #:nodoc:
    #- ©2009 Rick DeNatale
    #- All rights reserved. Refer to the file README.txt for the license
    #
    # Properties::Freebusy provides property accessing methods for the Freebusy class
    # This source file is generated by the  rical:gen_propmodules rake tasks, DO NOT EDIT
    module Freebusy

      # return the the CONTACT property
      # which will be an instances of RiCal::PropertyValueText
      # 
      # [purpose (from RFC 2445)]
      # The property is used to represent contact information oralternately a reference to contact information associated with the calendar component.
      # 
      # see RFC 2445 4.8.4.2 pp 104-106
      def contact_property
        @contact_property
      end

      # set the CONTACT property
      # property value should be an instance of RiCal::PropertyValueText
      def contact_property=(property_value)
        @contact_property = property_value
      end

      # set the value of the CONTACT property
      def contact=(ruby_value)
        self.contact_property= RiCal::PropertyValue::Text.convert(self, ruby_value)
      end

      # return the value of the CONTACT property
      # which will be an instance of String
      def contact
        contact_property ? contact_property.ruby_value : nil
      end

      def contact_property_from_string(line) # :nodoc:
        @contact_property = RiCal::PropertyValue::Text.new(self, line)
      end


      # return the the DTSTART property
      # which will be an instances of either RiCal::PropertyValue::DateTime or RiCal::PropertyValue::Date
      # 
      # [purpose (from RFC 2445)]
      # This property specifies when the calendar component begins.
      # 
      # see RFC 2445 4.8.2.4 pp 93-94
      def dtstart_property
        @dtstart_property
      end

      # set the DTSTART property
      # property value should be an instance of either RiCal::PropertyValue::DateTime or RiCal::PropertyValue::Date
      def dtstart_property=(property_value)
        @dtstart_property = property_value.for_parent(self)
      end

      # set the value of the DTSTART property
      def dtstart=(ruby_value)
        self.dtstart_property= RiCal::PropertyValue::DateTime.convert(self, ruby_value)
      end

      # return the value of the DTSTART property
      # which will be an instance of either DateTime or Date
      def dtstart
        dtstart_property ? dtstart_property.ruby_value : nil
      end

      def dtstart_property_from_string(line) # :nodoc:
        @dtstart_property = RiCal::PropertyValue::DateTime.or_date(self, line)
      end


      # return the the DTEND property
      # which will be an instances of either RiCal::PropertyValue::DateTime or RiCal::PropertyValue::Date
      # 
      # [purpose (from RFC 2445)]
      # This property specifies the date and time that a calendar component ends.
      # 
      # see RFC 2445 4.8.2.2 pp 91-92
      def dtend_property
        @dtend_property
      end

      # set the DTEND property
      # property value should be an instance of either RiCal::PropertyValue::DateTime or RiCal::PropertyValue::Date
      def dtend_property=(property_value)
        @dtend_property = property_value.for_parent(self)
      end

      # set the value of the DTEND property
      def dtend=(ruby_value)
        self.dtend_property= RiCal::PropertyValue::DateTime.convert(self, ruby_value)
      end

      # return the value of the DTEND property
      # which will be an instance of either DateTime or Date
      def dtend
        dtend_property ? dtend_property.ruby_value : nil
      end

      def dtend_property_from_string(line) # :nodoc:
        @dtend_property = RiCal::PropertyValue::DateTime.or_date(self, line)
      end


      # return the the DURATION property
      # which will be an instances of RiCal::PropertyValueDuration
      # 
      # [purpose (from RFC 2445)]
      # This property specifies a positive duration of time.
      # 
      # see RFC 2445 4.8.2.5 pp 94-95
      def duration_property
        @duration_property
      end

      # set the DURATION property
      # property value should be an instance of RiCal::PropertyValueDuration
      def duration_property=(property_value)
        @duration_property = property_value
      end

      # set the value of the DURATION property
      def duration=(ruby_value)
        self.duration_property= RiCal::PropertyValue::Duration.convert(self, ruby_value)
      end

      # return the value of the DURATION property
      # which will be an instance of Duration
      def duration
        duration_property ? duration_property.ruby_value : nil
      end

      def duration_property_from_string(line) # :nodoc:
        @duration_property = RiCal::PropertyValue::Duration.new(self, line)
      end


      # return the the DTSTAMP property
      # which will be an instances of RiCal::PropertyValueDateTime
      # 
      # [purpose (from RFC 2445)]
      # This property indicates the date/time that the instance of the iCalendar object was created.
      # 
      # see RFC 2445 4.8.7.2 pp 130-131
      def dtstamp_property
        @dtstamp_property
      end

      # set the DTSTAMP property
      # property value should be an instance of RiCal::PropertyValueDateTime
      def dtstamp_property=(property_value)
        @dtstamp_property = property_value.for_parent(self)
      end

      # set the value of the DTSTAMP property
      def dtstamp=(ruby_value)
        self.dtstamp_property= RiCal::PropertyValue::DateTime.convert(self, ruby_value)
      end

      # return the value of the DTSTAMP property
      # which will be an instance of DateTime
      def dtstamp
        dtstamp_property ? dtstamp_property.ruby_value : nil
      end

      def dtstamp_property_from_string(line) # :nodoc:
        @dtstamp_property = RiCal::PropertyValue::DateTime.new(self, line)
      end


      # return the the ORGANIZER property
      # which will be an instances of RiCal::PropertyValueCalAddress
      # 
      # [purpose (from RFC 2445)]
      # The property defines the organizer for a calendar component.
      # 
      # see RFC 2445 4.8.4.3 pp 106-107
      def organizer_property
        @organizer_property
      end

      # set the ORGANIZER property
      # property value should be an instance of RiCal::PropertyValueCalAddress
      def organizer_property=(property_value)
        @organizer_property = property_value
      end

      # set the value of the ORGANIZER property
      def organizer=(ruby_value)
        self.organizer_property= RiCal::PropertyValue::CalAddress.convert(self, ruby_value)
      end

      # return the value of the ORGANIZER property
      # which will be an instance of CalAddress
      def organizer
        organizer_property ? organizer_property.ruby_value : nil
      end

      def organizer_property_from_string(line) # :nodoc:
        @organizer_property = RiCal::PropertyValue::CalAddress.new(self, line)
      end


      # return the the UID property
      # which will be an instances of RiCal::PropertyValueText
      # 
      # [purpose (from RFC 2445)]
      # This property defines the persistent, globally unique identifier for the calendar component.
      # 
      # see RFC 2445 4.8.4.7 pp 111-112
      def uid_property
        @uid_property
      end

      # set the UID property
      # property value should be an instance of RiCal::PropertyValueText
      def uid_property=(property_value)
        @uid_property = property_value
      end

      # set the value of the UID property
      def uid=(ruby_value)
        self.uid_property= RiCal::PropertyValue::Text.convert(self, ruby_value)
      end

      # return the value of the UID property
      # which will be an instance of String
      def uid
        uid_property ? uid_property.ruby_value : nil
      end

      def uid_property_from_string(line) # :nodoc:
        @uid_property = RiCal::PropertyValue::Text.new(self, line)
      end


      # return the the URL property
      # which will be an instances of RiCal::PropertyValueUri
      # 
      # [purpose (from RFC 2445)]
      # This property defines a Uniform Resource Locator (URL) associated with the iCalendar object.
      # 
      # see RFC 2445 4.8.4.6 pp 110-111
      def url_property
        @url_property
      end

      # set the URL property
      # property value should be an instance of RiCal::PropertyValueUri
      def url_property=(property_value)
        @url_property = property_value
      end

      # set the value of the URL property
      def url=(ruby_value)
        self.url_property= RiCal::PropertyValue::Uri.convert(self, ruby_value)
      end

      # return the value of the URL property
      # which will be an instance of Uri
      def url
        url_property ? url_property.ruby_value : nil
      end

      def url_property_from_string(line) # :nodoc:
        @url_property = RiCal::PropertyValue::Uri.new(self, line)
      end


      # return the the ATTENDEE property
      # which will be an array of instances of RiCal::PropertyValueCalAddress
      # 
      # [purpose (from RFC 2445)]
      # The property defines an 'Attendee' within a calendar component.
      # 
      # see RFC 2445 4.8.4.1 pp 102-104
      def attendee_property
        @attendee_property ||= []
      end

      # set the the ATTENDEE property
      # one or more instances of RiCal::PropertyValueCalAddress may be passed to this method
      def attendee_property=(*property_values)
        @attendee_property= property_values
      end

      # set the value of the ATTENDEE property to multiple values
      # one or more instances of CalAddress may be passed to this method
      def attendees=(ruby_values)
        @attendee_property = ruby_values.map {|val| RiCal::PropertyValue::CalAddress.convert(self, val)}
      end

      # set the value of the ATTENDEE property to a single value
      # one instance of CalAddress may be passed to this method
      def attendee=(ruby_value)
        @attendee_property = [RiCal::PropertyValue::CalAddress.convert(self, ruby_value)]
      end

      # add one or more values to the ATTENDEE property
      # one or more instances of CalAddress may be passed to this method
      def  add_attendees(*ruby_values)
       ruby_values.each {|val|  self.attendee_property << RiCal::PropertyValue::CalAddress.convert(self, val)}
      end

      # add one value to the ATTENDEE property
      # one instances of CalAddress may be passed to this method
      def  add_attendee(ruby_value)
       self.attendee_property << RiCal::PropertyValue::CalAddress.convert(self, ruby_value)
      end

      # remove one or more values from the ATTENDEE property
      # one or more instances of CalAddress may be passed to this method
      def  remove_attendees(*ruby_values)
       ruby_values.each {|val|  self.attendee_property.delete(RiCal::PropertyValue::CalAddress.convert(self, val))}
      end

      # remove one value from the ATTENDEE property
      # one instances of CalAddress may be passed to this method
      def  remove_attendee(ruby_value)
       self.attendee_property.delete(RiCal::PropertyValue::CalAddress.convert(self, ruby_value))
      end

      # return the value of the ATTENDEE property
      # which will be an array of instances of CalAddress
      def attendee
        attendee_property.map {|prop| prop ? prop.ruby_value : prop}
      end

      def attendee_property_from_string(line) # :nodoc:
        attendee_property << RiCal::PropertyValue::CalAddress.new(self, line)
      end

      # return the the COMMENT property
      # which will be an array of instances of RiCal::PropertyValueText
      # 
      # [purpose (from RFC 2445)]
      # This property specifies non-processing information intended to provide a comment to the calendar user.
      # 
      # see RFC 2445 4.8.1.4 pp 80-81
      def comment_property
        @comment_property ||= []
      end

      # set the the COMMENT property
      # one or more instances of RiCal::PropertyValueText may be passed to this method
      def comment_property=(*property_values)
        @comment_property= property_values
      end

      # set the value of the COMMENT property to multiple values
      # one or more instances of String may be passed to this method
      def comments=(ruby_values)
        @comment_property = ruby_values.map {|val| RiCal::PropertyValue::Text.convert(self, val)}
      end

      # set the value of the COMMENT property to a single value
      # one instance of String may be passed to this method
      def comment=(ruby_value)
        @comment_property = [RiCal::PropertyValue::Text.convert(self, ruby_value)]
      end

      # add one or more values to the COMMENT property
      # one or more instances of String may be passed to this method
      def  add_comments(*ruby_values)
       ruby_values.each {|val|  self.comment_property << RiCal::PropertyValue::Text.convert(self, val)}
      end

      # add one value to the COMMENT property
      # one instances of String may be passed to this method
      def  add_comment(ruby_value)
       self.comment_property << RiCal::PropertyValue::Text.convert(self, ruby_value)
      end

      # remove one or more values from the COMMENT property
      # one or more instances of String may be passed to this method
      def  remove_comments(*ruby_values)
       ruby_values.each {|val|  self.comment_property.delete(RiCal::PropertyValue::Text.convert(self, val))}
      end

      # remove one value from the COMMENT property
      # one instances of String may be passed to this method
      def  remove_comment(ruby_value)
       self.comment_property.delete(RiCal::PropertyValue::Text.convert(self, ruby_value))
      end

      # return the value of the COMMENT property
      # which will be an array of instances of String
      def comment
        comment_property.map {|prop| prop ? prop.ruby_value : prop}
      end

      def comment_property_from_string(line) # :nodoc:
        comment_property << RiCal::PropertyValue::Text.new(self, line)
      end

      # return the the FREEBUSY property
      # which will be an array of instances of RiCal::PropertyValuePeriod
      # 
      # [purpose (from RFC 2445)]
      # This property defines one or more free or busy time intervals.
      # 
      # see RFC 2445 4.8.2.6 pp 95-96
      def freebusy_property
        @freebusy_property ||= []
      end

      # set the the FREEBUSY property
      # one or more instances of RiCal::PropertyValuePeriod may be passed to this method
      def freebusy_property=(*property_values)
        @freebusy_property= property_values
      end

      # set the value of the FREEBUSY property to multiple values
      # one or more instances of Period may be passed to this method
      def freebusys=(ruby_values)
        @freebusy_property = ruby_values.map {|val| RiCal::PropertyValue::Period.convert(self, val)}
      end

      # set the value of the FREEBUSY property to a single value
      # one instance of Period may be passed to this method
      def freebusy=(ruby_value)
        @freebusy_property = [RiCal::PropertyValue::Period.convert(self, ruby_value)]
      end

      # add one or more values to the FREEBUSY property
      # one or more instances of Period may be passed to this method
      def  add_freebusys(*ruby_values)
       ruby_values.each {|val|  self.freebusy_property << RiCal::PropertyValue::Period.convert(self, val)}
      end

      # add one value to the FREEBUSY property
      # one instances of Period may be passed to this method
      def  add_freebusy(ruby_value)
       self.freebusy_property << RiCal::PropertyValue::Period.convert(self, ruby_value)
      end

      # remove one or more values from the FREEBUSY property
      # one or more instances of Period may be passed to this method
      def  remove_freebusys(*ruby_values)
       ruby_values.each {|val|  self.freebusy_property.delete(RiCal::PropertyValue::Period.convert(self, val))}
      end

      # remove one value from the FREEBUSY property
      # one instances of Period may be passed to this method
      def  remove_freebusy(ruby_value)
       self.freebusy_property.delete(RiCal::PropertyValue::Period.convert(self, ruby_value))
      end

      # return the value of the FREEBUSY property
      # which will be an array of instances of Period
      def freebusy
        freebusy_property.map {|prop| prop ? prop.ruby_value : prop}
      end

      def freebusy_property_from_string(line) # :nodoc:
        freebusy_property << RiCal::PropertyValue::Period.new(self, line)
      end

      # return the the REQUEST-STATUS property
      # which will be an array of instances of RiCal::PropertyValueText
      # 
      # see RFC 2445 4.8.8.2 pp 134-136
      def request_status_property
        @request_status_property ||= []
      end

      # set the the REQUEST-STATUS property
      # one or more instances of RiCal::PropertyValueText may be passed to this method
      def request_status_property=(*property_values)
        @request_status_property= property_values
      end

      # set the value of the REQUEST-STATUS property to multiple values
      # one or more instances of String may be passed to this method
      def request_statuses=(ruby_values)
        @request_status_property = ruby_values.map {|val| RiCal::PropertyValue::Text.convert(self, val)}
      end

      # set the value of the REQUEST-STATUS property to a single value
      # one instance of String may be passed to this method
      def request_status=(ruby_value)
        @request_status_property = [RiCal::PropertyValue::Text.convert(self, ruby_value)]
      end

      # add one or more values to the REQUEST-STATUS property
      # one or more instances of String may be passed to this method
      def  add_request_statuses(*ruby_values)
       ruby_values.each {|val|  self.request_status_property << RiCal::PropertyValue::Text.convert(self, val)}
      end

      # add one value to the REQUEST-STATUS property
      # one instances of String may be passed to this method
      def  add_request_status(ruby_value)
       self.request_status_property << RiCal::PropertyValue::Text.convert(self, ruby_value)
      end

      # remove one or more values from the REQUEST-STATUS property
      # one or more instances of String may be passed to this method
      def  remove_request_statuses(*ruby_values)
       ruby_values.each {|val|  self.request_status_property.delete(RiCal::PropertyValue::Text.convert(self, val))}
      end

      # remove one value from the REQUEST-STATUS property
      # one instances of String may be passed to this method
      def  remove_request_status(ruby_value)
       self.request_status_property.delete(RiCal::PropertyValue::Text.convert(self, ruby_value))
      end

      # return the value of the REQUEST-STATUS property
      # which will be an array of instances of String
      def request_status
        request_status_property.map {|prop| prop ? prop.ruby_value : prop}
      end

      def request_status_property_from_string(line) # :nodoc:
        request_status_property << RiCal::PropertyValue::Text.new(self, line)
      end

      def export_properties_to(export_stream) #:nodoc:
        export_prop_to(export_stream, "REQUEST-STATUS", @request_status_property)
        export_prop_to(export_stream, "DTSTAMP", @dtstamp_property)
        export_prop_to(export_stream, "DTEND", @dtend_property)
        export_prop_to(export_stream, "DTSTART", @dtstart_property)
        export_prop_to(export_stream, "CONTACT", @contact_property)
        export_prop_to(export_stream, "ATTENDEE", @attendee_property)
        export_prop_to(export_stream, "UID", @uid_property)
        export_prop_to(export_stream, "DURATION", @duration_property)
        export_prop_to(export_stream, "URL", @url_property)
        export_prop_to(export_stream, "ORGANIZER", @organizer_property)
        export_prop_to(export_stream, "FREEBUSY", @freebusy_property)
        export_prop_to(export_stream, "COMMENT", @comment_property)
      end

      def ==(o) #:nodoc:
        if o.class == self.class
        (request_status_property == o.request_status_property) &&
        (dtstamp_property == o.dtstamp_property) &&
        (dtend_property == o.dtend_property) &&
        (dtstart_property == o.dtstart_property) &&
        (contact_property == o.contact_property) &&
        (attendee_property == o.attendee_property) &&
        (uid_property == o.uid_property) &&
        (duration_property == o.duration_property) &&
        (url_property == o.url_property) &&
        (organizer_property == o.organizer_property) &&
        (freebusy_property == o.freebusy_property) &&
        (comment_property == o.comment_property)
        else
           super
        end
      end

      def initialize_copy(o) #:nodoc:
        super
        request_status_property = request_status_property && request_status_property.dup
        dtstamp_property = dtstamp_property && dtstamp_property.dup
        dtend_property = dtend_property && dtend_property.dup
        dtstart_property = dtstart_property && dtstart_property.dup
        contact_property = contact_property && contact_property.dup
        attendee_property = attendee_property && attendee_property.dup
        uid_property = uid_property && uid_property.dup
        duration_property = duration_property && duration_property.dup
        url_property = url_property && url_property.dup
        organizer_property = organizer_property && organizer_property.dup
        freebusy_property = freebusy_property && freebusy_property.dup
        comment_property = comment_property && comment_property.dup
      end

      def add_date_times_to(required_timezones) #:nodoc:
        add_property_date_times_to(required_timezones, dtstart_property)
        add_property_date_times_to(required_timezones, dtend_property)
        add_property_date_times_to(required_timezones, dtstamp_property)
      end

      module ClassMethods #:nodoc:
        def property_parser #:nodoc:
          {"DTEND"=>:dtend_property_from_string, "DTSTART"=>:dtstart_property_from_string, "DTSTAMP"=>:dtstamp_property_from_string, "URL"=>:url_property_from_string, "CONTACT"=>:contact_property_from_string, "UID"=>:uid_property_from_string, "ATTENDEE"=>:attendee_property_from_string, "ORGANIZER"=>:organizer_property_from_string, "REQUEST-STATUS"=>:request_status_property_from_string, "FREEBUSY"=>:freebusy_property_from_string, "COMMENT"=>:comment_property_from_string, "DURATION"=>:duration_property_from_string}
        end
      end

      def self.included(mod) #:nodoc:
        mod.extend ClassMethods
      end

      def mutual_exclusion_violation #:nodoc:
        false
      end
    end
  end
end
