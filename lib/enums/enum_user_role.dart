enum UserRole {
  User,
  PengerusiMasjid,
  Imam,
  Bilal,
  Akauntan,
}

extension UserRoleExtension on UserRole {
  String toDisplayString() {
    switch (this) {
      case UserRole.User:
        return "User";
      case UserRole.PengerusiMasjid:
        return "Pengerusi Masjid";
      case UserRole.Imam:
        return "Imam";
      case UserRole.Bilal:
        return "Bilal";
      case UserRole.Akauntan:
        return "Akauntan";
    }
  }
}