class Note {
  String title;
  String? description = '';
  int id;

  Note({
    required this.title,
    this.description,
    required this.id
  });

  @override
  String toString() {
    return 'Note{title: $title, description: $description, id: $id}';
  }
}