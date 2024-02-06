import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movieapp/core/resources/data_state.dart';
import 'package:movieapp/core/util/logger_interceptor.dart';
import 'package:movieapp/features/now_playing_movies/data/data_sources/remote/movies_api_service.dart';
import 'package:movieapp/features/now_playing_movies/data/models/movie_model.dart';
import 'package:movieapp/features/now_playing_movies/domain/repository/movie_repository.dart';

class NowPlayingMovieRepositoryImpl implements NowPlayingMovieRepository {
  final MovieApiService _movieApiService;

  NowPlayingMovieRepositoryImpl(this._movieApiService);

  @override
  Future<DataState<List<Results>>> getNowPlayingMovies() async {
    try {
      final httpResponse = await _movieApiService.getNowPlayingMovies(
          include_adult: 'true',
          include_video: 'true',
          language: 'en-US',
          page: '1',
          sort_by: 'popularity.desc',
          with_release_type: '2|3',
          release_date_gte: '{min_date}',
          release_date_lte: '{max_date}');

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<Results>? results = httpResponse.data.results;
        if (results != null) {
          return DataSuccess(results);
        } else {
          logDebug("data error", level: Level.debug);
          return DataFailed(DioException(
              error: httpResponse.response.statusMessage,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              requestOptions: httpResponse.response.requestOptions));
        }
      } else {
        logDebug("data error", level: Level.debug);
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
