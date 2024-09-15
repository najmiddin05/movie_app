import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/search/presentation/pages/search_page.dart';
import 'package:movie_app/router/name_routes.dart';

mixin SearchMixin on State<SearchPage> {
  onChangedTextField(String text) {
    context.read<MovieBloc>().add(SearchMovieEvent(text: text));
  }

  void goToReadPage({required MovieModel movie}) {
    context.read<MovieBloc>().add(GetDataFromHomePageEvent(movie: movie));
    context.go(Routes.detailNamed());
    context.read<MovieBloc>().add(const GoDetailPageEvent());
  }
}
