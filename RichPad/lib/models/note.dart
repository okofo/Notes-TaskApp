class Note {
  final String title;
  final String body;
  final int id;
  final DateTime dateCreated;
  final DateTime dateLastModified;

  Note(
      {this.title = "",
      this.body = "",
      this.dateCreated,
      this.dateLastModified,
      this.id});

  Note copyWith({
    String title,
    DateTime time,
    String body,
  }) {
    return new Note(
      id: this.id,
      dateLastModified: DateTime.now(),
      dateCreated: this.dateCreated,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  int epochFromDate(DateTime dt) {
    return dt.millisecondsSinceEpoch ~/ 1000;
  }
}
