class Album {
  final int id;
  final int userId;
  final String title;

  const Album({required this.id, required this.userId, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'userId': int userId, 'id': int id, 'title': String title} =>
        Album(id: id, userId: userId, title: title),
      _ => throw FormatException('Failed to load album')
    };
  }

  Map toJson() {
    return {'id': id, 'userId': userId, 'title': title};
  }
}
