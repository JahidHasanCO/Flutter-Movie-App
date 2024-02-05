import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String? adult;
  final String? backdropPath;
  final String? genreIds;
  final String? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final String? video;
  final String? voteAverage;
  final String? voteCount;

  const MovieEntity(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount
    ];
  }
}
