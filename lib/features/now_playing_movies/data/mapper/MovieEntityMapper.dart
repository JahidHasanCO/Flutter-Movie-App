import 'package:movieapp/features/now_playing_movies/data/models/MovieModel.dart';
import 'package:movieapp/features/now_playing_movies/domain/entities/MovieEntity.dart';

class MovieEntityMapper {
  static MovieEntity mapToEntity(Results result) {
    return MovieEntity(
      adult: result.adult,
      backdropPath: result.backdropPath,
      genreIds: result.genreIds,
      id: result.id,
      originalLanguage: result.originalLanguage,
      originalTitle: result.originalTitle,
      overview: result.overview,
      popularity: result.popularity,
      posterPath: result.posterPath,
      releaseDate: result.releaseDate,
      title: result.title,
      video: result.video,
      voteAverage: result.voteAverage,
      voteCount: result.voteCount,
    );
  }

  static List<MovieEntity> mapListToEntityList(List<Results> resultsList) {
    return resultsList.map((result) => mapToEntity(result)).toList();
  }
}
