import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/home/presentation/pages/home/home_page.dart';
import 'package:movie_app/router/name_routes.dart';

mixin HomeMixin on State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(const GetAllDataEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void goToReadPage({required MovieModel movie}) {
    context.read<MovieBloc>().add(GetDataFromHomePageEvent(movie: movie));
    context.go(Routes.detailNamed());
    context.read<MovieBloc>().add(const GoDetailPageEvent());
  }
}
