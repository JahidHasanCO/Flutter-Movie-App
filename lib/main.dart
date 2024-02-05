import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/now_playing_movies/presentation/bloc/now_playing_movie/remote/remote_movie_bloc.dart';
import 'package:movieapp/features/now_playing_movies/presentation/bloc/now_playing_movie/remote/remote_movie_event.dart';
import 'injection_container.dart';
import 'features/now_playing_movies/presentation/pages/home/now_playing.dart';
import 'config/theme/app_themes.dart';


Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteMoviesBloc>(
      create: (context) => sl()..add(const GetNowPlayingMovies()),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const NowPlaying(),
    ));
  }
}
