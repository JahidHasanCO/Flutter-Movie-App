import 'package:movieapp/core/resources/data_state.dart';
import 'package:movieapp/features/now_playing_movies/domain/entities/movie_entity.dart';
import 'package:movieapp/features/now_playing_movies/domain/repository/movie_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetNowPlayingMoviesUseCase
    implements UseCase<DataState<List<MovieEntity>>, void> {
  final NowPlayingMovieRepository _movieRepository;

  GetNowPlayingMoviesUseCase(this._movieRepository);

  @override
  Future<DataState<List<MovieEntity>>> call({void params}) {
    return _movieRepository.getNowPlayingMovies();
  }
}
