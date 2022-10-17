const String tableNotes = 'notes';

class NoteFields {
  static const String id = '_id';
  static const String isImportant = '_isImportant';
  static const String number = '_number';
  static const String title = '_title';
  static const String description = '_description';
  static const String time = '_time';
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;
  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });
}
