import 'package:hive_flutter/hive_flutter.dart';

import 'note.dart';

class NoteAdapter extends TypeAdapter<Note> {
  @override
  Note read(BinaryReader reader) {
    return Note(
      title: reader.readString(),
      description: reader.readString()
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Note obj) {
    writer.writeString(obj.title!);
    writer.writeString(obj.description!);
  }

}