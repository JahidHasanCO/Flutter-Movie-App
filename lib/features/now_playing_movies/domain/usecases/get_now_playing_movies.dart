import 'package:movieapp/core/resources/data_state.dart';
import 'package:movieapp/features/now_playing_movies/domain/entities/MovieEntity.dart';
import 'package:movieapp/features/now_playing_movies/domain/repository/movie_repository.dart';
import '../../../../core/usecases/usecase.dart';

class GetNowPlayingMoviesUseCase implements UseCase<DataState<MovieEntity>,void>{

  final NowPlayingMovieRepository _movieRepository;

  GetNowPlayingMoviesUseCase(this._movieRepository);

  @override
  Future<DataState<MovieEntity>> call({void params}) {
    return _movieRepository.getNowPlayingMovies();
  }

}