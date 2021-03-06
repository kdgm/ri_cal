# encoding: utf-8

require File.join(File.dirname(__FILE__), %w[.. spec_helper])

describe RiCal::Component::Calendar do
  
  context ".occurrences" do
    
    context "all day weekly" do
      
      subject {
        calendars = RiCal.parse_string rectify_ical <<-TEXT
          BEGIN:VCALENDAR
          PRODID;X-RICAL-TZSOURCE=TZINFO:-//com.denhaven2/NONSGML ri_cal gem//EN
          CALSCALE:GREGORIAN
          VERSION:2.0
          BEGIN:VTIMEZONE
          TZID;X-RICAL-TZSOURCE=TZINFO:Europe/Amsterdam
          BEGIN:DAYLIGHT
          DTSTART:20160327T020000
          RDATE:20160327T020000
          RDATE:20170326T020000
          TZOFFSETFROM:+0100
          TZOFFSETTO:+0200
          TZNAME:CEST
          END:DAYLIGHT
          BEGIN:STANDARD
          DTSTART:20161030T030000
          RDATE:20161030T030000
          TZOFFSETFROM:+0200
          TZOFFSETTO:+0100
          TZNAME:CET
          END:STANDARD
          END:VTIMEZONE
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170827T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170827T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170827T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T163445Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170827T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276119
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160814T113000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160814T100000
          DTSTAMP;VALUE=DATE-TIME:20160817T151325Z
          UID:15276797
          SUMMARY:Zondagochtend
          RRULE:FREQ=WEEKLY;BYDAY=SU
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276797
          BEGIN:VALARM
          TRIGGER:+PT0M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:ds. A.J. Gunst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160821T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160821T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160821T100000
          DTSTAMP;VALUE=DATE-TIME:20160126T085123Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20160821T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15256071
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160828T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160828T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160828T100000
          DTSTAMP;VALUE=DATE-TIME:20160126T085442Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20160828T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15256076
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:student M. Blok
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160904T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160904T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160904T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T095808Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20160904T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263804
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160911T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160911T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160911T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T100714Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20160911T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263806
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160918T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160918T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160918T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T100931Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20160918T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263809
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160925T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160925T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20160925T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T101147Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20160925T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263810
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161002T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161002T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161002T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T101440Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20161002T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263814
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161009T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161009T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161009T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T101553Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20161009T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263816
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:ds. W. Harinck
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161016T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161016T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161016T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T101758Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20161016T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263820
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161023T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161023T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161023T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T101923Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263822
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161030T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161030T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161030T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T102039Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20161030T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263824
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161106T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161106T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161106T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T102155Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20161106T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263826
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161113T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161113T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161113T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T102314Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263828
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161120T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161120T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161120T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T102432Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20161120T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263830
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161127T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161127T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161127T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T102556Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20161127T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263832
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161204T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161204T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161204T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T102855Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263836
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161211T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161211T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161211T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T103004Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20161211T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263838
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:ds. S.W. Janse
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161218T113000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161218T093000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161218T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T103223Z
          UID:15276797
          DESCRIPTION:Heilig Avondmaal
          SUMMARY:Ger. Gemeente Kamperland 20161218T093000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263840
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161225T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161225T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20161225T100000
          DTSTAMP;VALUE=DATE-TIME:20160325T103415Z
          UID:15276797
          DESCRIPTION:1e Kerstdag
          SUMMARY:Ger. Gemeente Kamperland 20161225T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15263842
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170101T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170101T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170101T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T151931Z
          UID:15276797
          DESCRIPTION:Nieuwjaar
          SUMMARY:Ger. Gemeente Kamperland 20170101T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276033
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:ds. C. Harinck
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170108T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170108T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170108T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T152056Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170108T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276035
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:ds. W. Harinck
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170115T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170115T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170115T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T152205Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170115T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276037
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170122T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170122T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170122T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T152314Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170122T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276040
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170129T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170129T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170129T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T152416Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170129T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276045
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170205T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170205T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170205T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T152522Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170205T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276050
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170212T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170212T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170212T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T152617Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170212T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276054
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170219T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170219T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170219T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T152729Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170219T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276056
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170226T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170226T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170226T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T152904Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170226T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276059
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170305T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170305T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170305T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T153231Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170305T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276063
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170312T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170312T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170312T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T153324Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170312T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276065
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170319T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170319T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170319T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T153441Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170319T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276067
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170326T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170326T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170326T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T153550Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170326T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276069
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:ds. S.W. Janse
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170402T113000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170402T093000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170402T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T160341Z
          UID:15276797
          DESCRIPTION:bediening Heilig Avondmaal 20170402T093000
          SUMMARY:Ger. Gemeente Kamperland
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276071
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170409T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170409T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170409T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T160453Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170409T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276073
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170416T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170416T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170416T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T160705Z
          UID:15276797
          DESCRIPTION:Eerste Pasen
          SUMMARY:Ger. Gemeente Kamperland 20170416T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276076
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170423T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170423T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170423T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T160816Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170423T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276079
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170430T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170430T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170430T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T160931Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170430T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276081
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170507T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170507T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170507T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T161036Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170507T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276083
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170514T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170514T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170514T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T161140Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170514T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276085
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170521T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170521T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170521T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T161234Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170521T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276087
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170528T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170528T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170528T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T161419Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170528T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276090
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170604T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170604T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170604T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T161530Z
          UID:15276797
          DESCRIPTION:Eerste Pinksteren
          SUMMARY:Ger. Gemeente Kamperland 20170604T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276092
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170611T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170611T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170611T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T161719Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170611T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276094
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170618T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170618T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170618T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T161808Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170618T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276096
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170625T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170625T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170625T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T161903Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170625T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276098
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:student H.J. Agteresch
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170702T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170702T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170702T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T162425Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170702T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276101
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:ds.A.J. Gunst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170709T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170709T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170709T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T162615Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170709T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276104
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170716T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170716T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170716T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T162707Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170716T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276106
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170723T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170723T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170723T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T162800Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170723T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276108
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170730T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170730T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170730T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T162910Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170730T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276110
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:student H.E.P. Fortuyn
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170806T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170806T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170806T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T163106Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170806T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276112
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170813T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170813T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170813T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T163150Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170813T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276114
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          BEGIN:VEVENT
          CONTACT:leesdienst
          DTEND;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170820T120000
          DTSTART;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170820T100000
          RECURRENCE-ID;TZID=Europe/Amsterdam;VALUE=DATE-TIME:20170820T100000
          DTSTAMP;VALUE=DATE-TIME:20160801T163258Z
          UID:15276797
          SUMMARY:Ger. Gemeente Kamperland 20170820T100000
          CLASS:PUBLIC
          RELATED-TO:RELTYPE=SELF:15276116
          RELATED-TO:RELTYPE=PARENT:15276797
          BEGIN:VALARM
          TRIGGER:-PT5M
          END:VALARM
          END:VEVENT
          END:VCALENDAR
TEXT
        calendars.first
      }

      its(:events) { should have(55).items }
      
      it {
        subject.occurrences(starting: Date.parse('20160825'), count: 6).should have(6).items
      }
      
      it {
        subject.occurrences(starting: Date.parse('20160825'), count: 6).map{|o| [o.dtstart, o.summary].join(' ')}.should eql([
          "2016-08-28T10:00:00+02:00 Ger. Gemeente Kamperland 20160828T100000",
          "2016-09-04T10:00:00+02:00 Ger. Gemeente Kamperland 20160904T100000",
          "2016-09-11T10:00:00+02:00 Ger. Gemeente Kamperland 20160911T100000",
          "2016-09-18T10:00:00+02:00 Ger. Gemeente Kamperland 20160918T100000",
          "2016-09-25T10:00:00+02:00 Ger. Gemeente Kamperland 20160925T100000",
          "2016-10-02T10:00:00+02:00 Ger. Gemeente Kamperland 20161002T100000",
        ])
      }
    end
  end
end

