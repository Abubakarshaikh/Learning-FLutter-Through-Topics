class Movie {
  final String title;

  Movie({
    required this.title,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['title'] ?? '',
    );
  }
}
