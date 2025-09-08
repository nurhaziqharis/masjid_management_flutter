import 'package:masjid_management_flutter/enums/enum_event_category.dart';

class Event {
  final String name;
  final String description;
  final String location;
  final DateTime? startTime;
  final DateTime? endTime;
  final EventCategory category;

  Event({
    required this.name,
    required this.description,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.category,
  });
}
