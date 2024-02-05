import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/features/now_playing_movies/data/data_sources/remote/movies_api_service.dart';
import 'package:movieapp/features/now_playing_movies/data/repository/movie_repository_impl.dart';
import 'package:movieapp/features/now_playing_movies/domain/repository/movie_repository.dart';
import 'package:movieapp/features/now_playing_movies/domain/usecases/get_now_playing_movies.dart';
import 'features/now_playing_movies/presentation/bloc/now_playing_movie/remote/remote_movie_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<MovieApiService>(MovieApiService(sl()));

  sl.registerSingleton<NowPlayingMovieRepository>(
      NowPlayingMovieRepositoryImpl(sl()));

  sl.registerSingleton<GetNowPlayingMoviesUseCase>(
      GetNowPlayingMoviesUseCase(sl()));

  sl.registerFactory<RemoteMoviesBloc>(() => RemoteMoviesBloc(sl()));
}
