import 'package:dio/dio.dart';
import 'package:movieapp/features/now_playing_movies/data/models/movie_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';

part 'movies_api_service.g.dart';

@RestApi(baseUrl: tmdbBaseUrl)
abstract class MovieApiService {
  factory MovieApiService(Dio dio) = _MovieApiService;

  @GET('/discover/movie')
  Future<HttpResponse<MovieModel>> getNowPlayingMovies({
    @Query("api_key") String api_key = api_key,
    @Query("include_adult") String? include_adult,
    @Query("include_video") String? include_video,
    @Query("language") String? language,
    @Query("page") String? page,
    @Query("sort_by") String? sort_by,
    @Query("with_release_type") String? with_release_type,
    @Query("release_date.gte") String? release_date_gte,
    @Query("release_date.lte") String? release_date_lte,
  });
}
