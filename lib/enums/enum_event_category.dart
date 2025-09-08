enum EventCategory {
  EMPTY,
  Festival,
  KnowledgeSharing,
  Routine,
  Seminar,
}

extension EventCategoryExtension on EventCategory {
  String toApiValue() {
    switch (this) {
      case EventCategory.EMPTY:
        return "Empty";
      case EventCategory.Festival:
        return "Festival";
      case EventCategory.KnowledgeSharing:
        return "Knowledge Sharing";
      case EventCategory.Routine:
        return "Routine";
      case EventCategory.Seminar:
        return "Seminar";
    }
  }
}