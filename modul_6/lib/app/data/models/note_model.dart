class Note {
  final String id;
  final String title;
  final String description;
  final String dateCreated;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.dateCreated,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['\$id'],
      title: map['title'],
      description: map['description'],
      dateCreated: map['date_created'],
    );
  }
}
