// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final MovieStatus status;
  final MovieResponse? dataNowPlaying;
  final MovieResponse? dataUpcoming;
  final MovieResponse? dataTopRated;
  final MovieResponse? dataPopular;
  final String? errorMessage;
  final MovieModel? movie;
  final List<MovieModel> filterData;
  final List<int> ids;
  final bool isBookmarked;

  const MovieState({
    this.status = MovieStatus.initial,
    this.dataNowPlaying,
    this.dataUpcoming,
    this.dataTopRated,
    this.dataPopular,
    this.errorMessage,
    this.movie,
    this.filterData = const [],
    this.ids = const [],
    this.isBookmarked = false,
  });

  @override
  List<Object?> get props => [status, dataNowPlaying, errorMessage, dataUpcoming, dataTopRated, dataPopular, movie, filterData, ids, isBookmarked];

  MovieState copyWith({
    MovieStatus? status,
    MovieResponse? dataNowPlaying,
    MovieResponse? dataUpcoming,
    MovieResponse? dataTopRated,
    MovieResponse? dataPopular,
    String? errorMessage,
    MovieModel? movie,
    List<MovieModel>? filterData,
    List<int>? ids,
    bool? isBookmarked,
  }) {
    return MovieState(
      status: status ?? this.status,
      dataNowPlaying: dataNowPlaying ?? this.dataNowPlaying,
      dataUpcoming: dataUpcoming ?? this.dataUpcoming,
      dataTopRated: dataTopRated ?? this.dataTopRated,
      dataPopular: dataPopular ?? this.dataPopular,
      errorMessage: errorMessage ?? this.errorMessage,
      movie: movie ?? this.movie,
      filterData: filterData ?? this.filterData,
      ids: ids ?? this.ids,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }

  @override
  bool get stringify => true;
}

enum MovieStatus { initial, loading, error, success, goDetailPage, successStoreData }
