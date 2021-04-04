class NotesModal {
  int _id;
  String _noteTitle;
  String _textNote;

  NotesModal({int id, String noteTitle, String textNote})
      : _id = id,
        _noteTitle = noteTitle,
        _textNote = textNote;

  int get id => _id;
  String get noteTitle => _noteTitle;
  String get textNote => _textNote;

  NotesModal.fromMap(Map<String, dynamic> data) {
    _id = data["id"];
    _noteTitle = data["noteTitle"];
    _textNote = data["textNote"];
  }

  Map<String, dynamic> toMap() =>
      {"id": _id, "noteTitle": _noteTitle, "textNote": _textNote};
}
