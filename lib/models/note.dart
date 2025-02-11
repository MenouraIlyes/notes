class Note {
  final String id; // Unique identifier for the note
  final String title;
  final String content;
  final String timestamp;
  bool isFavorite;

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.timestamp,
    this.isFavorite = false,
  });

  // Optional: Add a method to convert the note to a map (useful for serialization)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'timestamp': timestamp,
      'isFavorite': isFavorite,
    };
  }

  // Optional: Add a factory method to create a note from a map (useful for deserialization)
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      timestamp: map['timestamp'],
      isFavorite: map['isFavorite'],
    );
  }
}
