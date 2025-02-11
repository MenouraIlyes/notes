import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/models/note.dart';

class NoteService {
  // Collection
  final CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');

  // Create a new note
  Future<String> createNote(Note note) async {
    try {
      // Create a new document with auto-generated ID
      DocumentReference docRef = await _notesCollection.add({
        'title': note.title,
        'content': note.content,
        'timestamp': note.timestamp,
        'isFavorite': note.isFavorite,
      });

      return docRef.id;
    } catch (e) {
      throw Exception('Failed to create note: $e');
    }
  }

  // Read all notes
  Stream<List<Note>> getNotes() {
    return _notesCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Note.fromMap({
          'id': doc.id,
          ...data,
        });
      }).toList();
    });
  }

  // Read a single note
  Future<Note?> getNoteById(String id) async {
    try {
      DocumentSnapshot doc = await _notesCollection.doc(id).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Note.fromMap({
          'id': doc.id,
          ...data,
        });
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get note: $e');
    }
  }

  // Update a note
  Future<void> updateNote(Note note) async {
    try {
      await _notesCollection.doc(note.id).update({
        'title': note.title,
        'content': note.content,
        'timestamp': note.timestamp,
        'isFavorite': note.isFavorite,
      });
    } catch (e) {
      throw Exception('Failed to update note: $e');
    }
  }

  // Toggle favorite status
  Future<void> toggleFavorite(String id, bool isFavorite) async {
    try {
      await _notesCollection.doc(id).update({
        'isFavorite': isFavorite,
      });
    } catch (e) {
      throw Exception('Failed to toggle favorite: $e');
    }
  }

  // Delete a note
  Future<void> deleteNote(String id) async {
    try {
      await _notesCollection.doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete note: $e');
    }
  }

  // Search notes by title or content
  Stream<List<Note>> searchNotes(String query) {
    return _notesCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return Note.fromMap({
              'id': doc.id,
              ...data,
            });
          })
          .where((note) =>
              note.title.toLowerCase().contains(query.toLowerCase()) ||
              note.content.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // Get favorite notes
  Stream<List<Note>> getFavoriteNotes() {
    return _notesCollection
        .where('isFavorite', isEqualTo: true)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Note.fromMap({
          'id': doc.id,
          ...data,
        });
      }).toList();
    });
  }
}
