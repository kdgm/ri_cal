# encoding: utf-8

require File.join(File.dirname(__FILE__), %w[.. spec_helper])

# In Europe/Amsterdam the clocks skip 02:00-03:00 on 2027-03-28 and repeat
# 02:00-03:00 on 2027-10-31.
describe "daylight saving time changes" do
  def utc_value(time)
    time.to_datetime.new_offset(0).strftime("%Y%m%dT%H%M%SZ")
  end

  describe RiCal::Component::Calendar::TZInfoWrapper do
    let(:calendar) { RiCal.Calendar }
    let(:time_zone) { RiCal::Component::Calendar::TZInfoWrapper.new(TZInfo::Timezone.get("Europe/Amsterdam"), calendar) }

    def local(value)
      RiCal::PropertyValue::DateTime.new(calendar, :value => value, :params => {"TZID" => "Europe/Amsterdam"})
    end

    describe "#local_to_utc" do
      it "converts a local time outside a DST change with the offset of that day" do
        expect(time_zone.local_to_utc(local("20270327T022000")).value).to eq("20270327T012000Z")
      end

      it "moves a local time that the spring DST change skips forward by the skipped hour" do
        expect(time_zone.local_to_utc(local("20270328T022000")).value).to eq("20270328T012000Z")
      end

      it "resolves a local time that the autumn DST change repeats to its first, summer time, occurrence" do
        expect(time_zone.local_to_utc(local("20271031T022000")).value).to eq("20271031T002000Z")
      end
    end

    describe "#rational_utc_offset" do
      it "gives a local time that the spring DST change skips the offset from before the change" do
        offset = time_zone.rational_utc_offset(DateTime.civil(2027, 3, 28, 2, 20, 0))

        expect(offset).to eq(Rational(1, 24))
      end
    end
  end

  describe "occurrences of a daily event" do
    def daily_event(dtstart, dtend, exdate = nil)
      exdate_line = exdate ? "EXDATE;TZID=Europe/Amsterdam:#{exdate}" : ""
      RiCal.parse_string(rectify_ical(<<-TEXT
          BEGIN:VCALENDAR
          PRODID;X-RICAL-TZSOURCE=TZINFO:-//com.denhaven2/NONSGML ri_cal gem//EN
          CALSCALE:GREGORIAN
          VERSION:2.0
          BEGIN:VEVENT
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:#{dtstart}
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:#{dtend}
          UID:daily
          RRULE:FREQ=DAILY
          #{exdate_line}
          END:VEVENT
          END:VCALENDAR
        TEXT
      )).first.events.first
    end

    def utc_times(event, starting)
      occurrence = event.occurrences(:starting => starting, :count => 1).first

      [utc_value(occurrence.dtstart), utc_value(occurrence.dtend)]
    end

    it "moves an end in the hour that the spring DST change skips forward by that hour" do
      event = daily_event("20261119T142000", "20261120T022000")

      expect(utc_times(event, DateTime.civil(2027, 3, 27))).to eq(["20270327T132000Z", "20270328T012000Z"])
    end

    it "resolves an end in the hour that the autumn DST change repeats to its first, summer time, occurrence" do
      event = daily_event("20261119T142000", "20261120T022000")

      expect(utc_times(event, DateTime.civil(2027, 10, 30))).to eq(["20271030T122000Z", "20271031T002000Z"])
    end

    it "moves an occurrence that starts in the skipped hour forward by that hour, keeping its length" do
      event = daily_event("20261119T023000", "20261119T031500")

      expect(utc_times(event, DateTime.civil(2027, 3, 28))).to eq(["20270328T013000Z", "20270328T021500Z"])
    end

    it "moves an occurrence that starts and ends in the skipped hour forward by that hour" do
      event = daily_event("20261119T021000", "20261119T024000")

      expect(utc_times(event, DateTime.civil(2027, 3, 28))).to eq(["20270328T011000Z", "20270328T014000Z"])
    end

    it "excludes an occurrence that starts in the skipped hour by the time it moves to" do
      event = daily_event("20261119T023000", "20261119T031500", "20270328T033000")
      starts = event.occurrences(:starting => DateTime.civil(2027, 3, 27), :count => 2).map { |occurrence| utc_value(occurrence.dtstart) }

      expect(starts).to eq(["20270327T013000Z", "20270329T003000Z"])
    end

    it "excludes an occurrence that starts in the skipped hour by its skipped time" do
      event = daily_event("20261119T023000", "20261119T031500", "20270328T023000")
      starts = event.occurrences(:starting => DateTime.civil(2027, 3, 27), :count => 2).map { |occurrence| utc_value(occurrence.dtstart) }

      expect(starts).to eq(["20270327T013000Z", "20270329T003000Z"])
    end

    it "keeps an occurrence outside the skipped hour on the day of the change" do
      event = daily_event("20261119T100000", "20261119T110000")

      expect(utc_times(event, DateTime.civil(2027, 3, 28))).to eq(["20270328T080000Z", "20270328T090000Z"])
    end

    it "keeps the dates of an all-day occurrence" do
      event = RiCal.Event do |template|
        template.dtstart = Date.new(2026, 11, 19)
        template.dtend = Date.new(2026, 11, 20)
        template.rrule = "FREQ=DAILY"
      end
      occurrence = event.occurrences(:starting => Date.new(2027, 3, 28), :count => 1).first

      expect([occurrence.dtstart.to_s, occurrence.dtend.to_s]).to eq(["2027-03-28", "2027-03-29"])
    end
  end
end
