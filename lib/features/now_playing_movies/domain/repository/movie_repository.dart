import '../entities/movie_entity.dart';
import '../../../../core/resources/data_state.dart';

abstract class NowPlayingMovieRepository {
  Future<DataState<List<MovieEntity>>> getNowPlayingMovies();
}
