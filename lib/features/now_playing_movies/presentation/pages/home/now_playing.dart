import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/now_playing_movies/presentation/bloc/now_playing_movie/remote/remote_movie_bloc.dart';
import 'package:movieapp/features/now_playing_movies/presentation/bloc/now_playing_movie/remote/remote_movie_event.dart';
import 'package:movieapp/features/now_playing_movies/presentation/bloc/now_playing_movie/remote/remote_movie_state.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Now Playing Movies',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteMoviesBloc, RemoteMovieState>(
        builder: (_, state) {
          if (state is RemoteMoviesLoading) {
            return const Center(child: CupertinoActivityIndicator(),);
          }
          if (state is RemoteMoviesError) {
            return const Center(child: Icon(Icons.refresh),);
          }
          if (state is RemoteMoviesDone) {
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text('$index'),
              );
            });
          }

          return const SizedBox();
        }
    );
  }
}
