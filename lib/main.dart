import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/app.dart';
import 'package:movie_app/core/constants.dart';
import 'package:movie_app/features/home/data/repository/movie_repository_impl.dart';
import 'package:movie_app/features/home/domain/repository/movie_repository.dart';
import 'package:movie_app/features/home/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/injector_container.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();

  if (!kIsWeb) {
    await init(); // Only run the initialization on non-web platforms
  }
  // await init();
  saveEmptyListOnFirstLaunch();

  runApp(const App());
}

Future<void> saveEmptyListOnFirstLaunch() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

  if (isFirstLaunch) {
    await prefs.setString(StorageKey.movie.name, jsonEncode([]));

    await prefs.setBool('isFirstLaunch', false);

    log('Stored empty list to local storage: []');
  }
}
