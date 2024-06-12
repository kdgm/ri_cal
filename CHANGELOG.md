## Release 0.9.5
- [enh] add _dump and _load methods to serialize and deserialize events

## Version 0.9.4

* Fix bug caused by limiting count on add_instances.
* Various refactorings.

## Version 0.9.3

* Optimize for case of large number of instances
* Refactor to silence deprecation warnings

## Version 0.9.2

* Handle case where count is less than zero.
  This would cause `ArgumentError: negative array size`

## Version 0.9.1

* Add detection of unbounded component in `RiCal::Calendar#occurrences`. This prevents us
  from entering into an endless loop.

## Version 0.9.0

* Added the `RiCal::Calendar#occurrences` method to return all occurrences for the
  calendar taking recurring event instances into account. These events have the same `id`
  as the parent event and have `recurrence_id` set to the original `dtstart` of the event
  in the recurrence.

  `RiCal::Calendar#occurrences` takes the same `options` as `RiCal::Event#occurrences`
  with the same behavior.
