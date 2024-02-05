import '../entities/MovieEntity.dart';
import '../../../../core/resources/data_state.dart';

abstract class NowPlayingMovieRepository{
  Future<DataState<MovieEntity>> getNowPlayingMovies();
}