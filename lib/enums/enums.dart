enum Category {
  EMPTY,
  Festival,
  KnowledgeSharing,
  Routine,
  Seminar,
}

extension CategoryExtension on Category {
  String toApiValue() {
    switch (this) {
      case Category.EMPTY:
        return "Empty";
      case Category.Festival:
        return "Festival";
      case Category.KnowledgeSharing:
        return "Knowledge Sharing";
      case Category.Routine:
        return "Routine";
      case Category.Seminar:
        return "Seminar";
    }
  }
}