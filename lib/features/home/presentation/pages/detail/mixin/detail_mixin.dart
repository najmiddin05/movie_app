import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/home/presentation/pages/detail/detail_page.dart';

mixin DetailMixin on State<DetailPage> {
  List<int> ids = [];

  @override
  void initState() {
    super.initState();
    _loadmovies();
  }

  void _loadmovies() {
    context.read<MovieBloc>().add(const GetMovieIdEvent());
    final storedMovies = context.read<MovieBloc>().state.ids;
    ids = storedMovies.toSet().toList(); // Ensure no duplicates

    if (ids.isNotEmpty) {
      final currentMovie = context.read<MovieBloc>().state.movie;
      if (currentMovie != null) {
        context.read<MovieBloc>().add(IsBookMarkedEvent(isBookmarked: ids.contains(currentMovie.id)));
      }
    }
  }

  void toggleBookmark() {
    final currentMovie = context.read<MovieBloc>().state.movie;
    if (currentMovie != null) {
      final storedMovies = context.read<MovieBloc>().state.ids;
      ids = storedMovies.toSet().toList();

      if (context.read<MovieBloc>().state.isBookmarked) {
        ids.remove(currentMovie.id);
      } else if (!ids.contains(currentMovie.id)) {
        ids.add(currentMovie.id);
      }

      context.read<MovieBloc>().add(StoreMovieIdEvent(ids: ids));
      context.read<MovieBloc>().add(IsBookMarkedEvent(isBookmarked: !context.read<MovieBloc>().state.isBookmarked));
    }
  }
}
