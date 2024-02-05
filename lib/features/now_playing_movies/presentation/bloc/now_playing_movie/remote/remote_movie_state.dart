import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movieapp/features/now_playing_movies/domain/entities/MovieEntity.dart';

abstract class RemoteMovieState extends Equatable {
  final List<MovieEntity>? movies;
  final DioException? error;

  const RemoteMovieState({this.movies, this.error});

  @override
  List<Object> get props {
    return [movies!, error!];
  }
}

class RemoteMoviesLoading extends RemoteMovieState {
  const RemoteMoviesLoading();
}

class RemoteMoviesDone extends RemoteMovieState {
  const RemoteMoviesDone(List<MovieEntity> movies) : super(movies: movies);
}

class RemoteMoviesError extends RemoteMovieState {
  const RemoteMoviesError(DioException error) : super(error: error);
}
