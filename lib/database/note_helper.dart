
import 'package:hive/hive.dart';

import '../models/note.dart';

class NoteHelper {
  static const String noteBox = 'NOTE';
  static const String noteKey = 'KEY';
  static List<Note> notes = [];

  static void createNote(Note note) {
    notes.add(note);
    Hive.box(noteBox).put(noteKey, notes);
  }

  static void getNotes() {
    notes = Hive.box(noteBox).get(noteKey).cast<Note>();
  }

  static void updateNote(Note note, int index) {
    notes[index] = note;
    Hive.box(noteBox).put(noteKey, notes);
  }

  static void deleteNote(int index) {
    notes.removeAt(index);
    Hive.box(noteBox).put(noteKey, notes);
  }
}
