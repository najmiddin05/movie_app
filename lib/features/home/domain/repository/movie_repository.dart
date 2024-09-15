import 'package:movie_app/core/either/either.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/home/data/models/movie_response.dart';

abstract class MovieRepository {
  const MovieRepository();

  Future<Either<Failure, MovieResponse>> getAllMovies({required String api});

  Future<bool> storeMovies(List<int> ids);
  String? getMovies();
}
