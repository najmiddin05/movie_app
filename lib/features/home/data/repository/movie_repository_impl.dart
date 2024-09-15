import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/core/constants.dart';
import 'dart:developer';
import 'package:movie_app/core/constants/constats.dart';
import 'package:movie_app/core/either/either.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/error/server_error.dart';
import 'package:movie_app/core/local_source/shared_preferences/local_data_source.dart';
import 'package:movie_app/features/home/data/models/movie_response.dart';
import 'package:movie_app/features/home/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio dio;
  final LocalDataSource localDS;

  MovieRepositoryImpl({required this.dio, required this.localDS});

  @override
  Future<Either<Failure, MovieResponse>> getAllMovies({required String api}) async {
    try {
      final Response<dynamic> response = await dio.get('${Constants.baseUrl}$api');
      final Map<String, Object?> data = response.data;
      return Right<Failure, MovieResponse>(
        MovieResponse.fromJson(data),
      );
    } on DioException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, MovieResponse>(
        ServerError.withDioError(error: error).failure,
      );
    }
  }

  @override
  String? getMovies() {
    final String? ids = localDS.read(StorageKey.movie);
    log('Read movies from local storage: $ids');
    return ids;
  }

  @override
  Future<bool> storeMovies(List<int> ids) async {
    try {
      final uniqueIds = ids.toSet().toList(); // Ensure no duplicates
      await localDS.store(StorageKey.movie, jsonEncode(uniqueIds));
      return true;
    } catch (e) {
      log('Failed to store movies: $e');
      return false;
    }
  }
}
