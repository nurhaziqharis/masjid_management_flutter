import 'package:masjid_management_flutter/enums/enums.dart';

class Event {
  final String name;
  final String description;
  final String location;
  final DateTime? startTime;
  final DateTime? endTime;
  final Category category;

  Event({
    required this.name,
    required this.description,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.category,
  });
}
