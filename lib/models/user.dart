import 'package:masjid_management_flutter/enums/enum_event_category.dart';
import 'package:masjid_management_flutter/enums/enum_user_role.dart';

class User {
  final String username;
  final String email;
  final String fullName;
  final UserRole role;
  final bool isActive;
  final DateTime lastLogin;

  User({
    required this.username,
    required this.email,
    required this.fullName,
    required this.role,
    required this.isActive,
    required this.lastLogin,
  });
}