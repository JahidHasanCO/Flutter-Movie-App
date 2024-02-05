import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/resources/data_state.dart';
import 'package:movieapp/features/now_playing_movies/domain/usecases/get_now_playing_movies.dart';

import 'remote_movie_event.dart';
import 'remote_movie_state.dart';

class RemoteMoviesBloc extends Bloc<RemoteMovieEvent, RemoteMovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  RemoteMoviesBloc(this.getNowPlayingMoviesUseCase)
      : super(const RemoteMoviesLoading()) {
    on<GetNowPlayingMovies>(onGetNowPlayingMovies);
  }

  Future<void> onGetNowPlayingMovies(
      GetNowPlayingMovies event, Emitter<RemoteMovieState> emitter) async {
    final dataState = await getNowPlayingMoviesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emitter(RemoteMoviesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emitter(RemoteMoviesError(dataState.error!));
    }
  }
}
