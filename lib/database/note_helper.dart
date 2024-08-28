import 'package:hive/hive.dart';

import '../models/note.dart';

class NoteHelper {
  static const String noteBox = 'NOTE', noteKey = 'KEY';
  static List<Note> notes = [];
  static List<Note> searchList = [];

  static void createNote(Note note) {
    notes.add(note);
    Hive.box(noteBox).put(noteKey, notes);
  }

  static void getNotes() {
    var intendedList = Hive.box(noteBox).get(noteKey);
    if (intendedList != null) {
      notes = intendedList.cast<Note>();
      searchList = intendedList.cast<Note>();
    }else {
      notes = <Note>[];
      searchList = <Note>[];
    }
  }

  static void updateNote(Note note, int index) {
    notes[index] = note;
    Hive.box(noteBox).put(noteKey, notes);
  }

  static void deleteNote(int index) {
    print('index: ' + index.toString());
    notes.removeAt(NoteHelper.notes.indexOf(NoteHelper.searchList[index]));
    searchList.removeAt(index);
    Hive.box(noteBox).put(noteKey, notes);
  }
}
