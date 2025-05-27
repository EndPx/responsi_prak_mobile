class Movie {
  final String? id;
  final String? title;
  final String? releaseDate;
  final String? createDate;
  final String? imgUrl;
  final String? rating;
  final List<dynamic>? genre;
  final String? description;
  final String? director;
  final List<dynamic>? cast;
  final String? language;
  final String? duration;

  Movie({
    this.id,
    this.title,
    this.releaseDate,
    this.createDate,
    this.imgUrl,
    this.rating,
    this.genre,
    this.description,
    this.director,
    this.cast,
    this.language,
    this.duration,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id']?.toString(),
      title: json['title'],
      releaseDate: json['release_date'],
      imgUrl: json['imgUrl'],
      createDate: json['created_at'],
      rating: json['rating'],
      genre: json['genre'],
      description: json['description'],
      director: json['director'],
      cast: json['cast'],
      language: json['language'],
      duration: json['duration'],
    );
  }
}