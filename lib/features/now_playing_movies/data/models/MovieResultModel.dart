import 'package:movieapp/features/now_playing_movies/domain/entities/MovieEntity.dart';

class MovieResultModel extends MovieEntity {

  const MovieResultModel({
    String? adult,
    String? backdropPath,
    String? genreIds,
    String? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    String? video,
    String? voteAverage,
    String? voteCount,
  });

  factory MovieResultModel.fromJson(Map <String, dynamic> map) {
    return MovieResultModel(
        adult: map['adult'] ?? "",
        backdropPath: map['backdrop_path'] ?? "",
        genreIds: map['genre_ids'] ?? "",
        id: map['id'] ?? "",
        originalLanguage: map['original_language'] ?? "",
        originalTitle: map['original_title'] ?? "",
        overview: map['overview'] ?? "",
        popularity: map['popularity'] ?? "",
        posterPath: map['poster_path'] ?? "",
        releaseDate: map['release_date'] ?? "",
        title: map['title'] ?? "",
        video: map['video'] ?? "",
        voteAverage: map['vote_average'] ?? "",
        voteCount: map['vote_count'] ?? ""
    );
  }
}