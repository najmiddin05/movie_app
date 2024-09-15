import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/constants/constats.dart';
import 'package:movie_app/core/either/either.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/data/models/movie_response.dart';
import 'package:movie_app/features/home/domain/repository/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;
  MovieBloc({required this.repository}) : super(const MovieState()) {
    on<GetAllDataEvent>(_getAllMovie);
    on<GoDetailPageEvent>(_goDetailPage);
    on<GetDataFromHomePageEvent>(_getDataFromHomePageEvent);
    on<SearchMovieEvent>(_searchMovie);
    on<GetMovieIdEvent>(_getMovieId);
    on<StoreMovieIdEvent>(_storeMovieId);
    on<IsBookMarkedEvent>(_isBookmarked);
  }

  void _getAllMovie(GetAllDataEvent event, Emitter<MovieState> emit) async {
    emit(const MovieState(status: MovieStatus.loading));

    final Either<Failure, MovieResponse> result1 = await repository.getAllMovies(api: Constants.nowPlayingMovies);
    final Either<Failure, MovieResponse> result2 = await repository.getAllMovies(api: Constants.upcomingMovies);
    final Either<Failure, MovieResponse> result3 = await repository.getAllMovies(api: Constants.topRatedMovies);
    final Either<Failure, MovieResponse> result4 = await repository.getAllMovies(api: Constants.popularMovies);

    result1.fold((Failure l) {
      emit(state.copyWith(
        status: MovieStatus.error,
        errorMessage: (l as ServerFailure).message,
      ));
    }, (MovieResponse r) {
      emit(
        state.copyWith(
          dataNowPlaying: r,
          status: MovieStatus.success,
        ),
      );
    });

    result2.fold((Failure l) {
      emit(state.copyWith(
        status: MovieStatus.error,
        errorMessage: (l as ServerFailure).message,
      ));
    }, (MovieResponse r) {
      emit(
        state.copyWith(
          dataUpcoming: r,
          status: MovieStatus.success,
        ),
      );
    });

    result3.fold((Failure l) {
      emit(state.copyWith(
        status: MovieStatus.error,
        errorMessage: (l as ServerFailure).message,
      ));
    }, (MovieResponse r) {
      emit(
        state.copyWith(
          dataTopRated: r,
          status: MovieStatus.success,
        ),
      );
    });

    result4.fold((Failure l) {
      emit(state.copyWith(
        status: MovieStatus.error,
        errorMessage: (l as ServerFailure).message,
      ));
    }, (MovieResponse r) {
      emit(
        state.copyWith(
          dataPopular: r,
          status: MovieStatus.success,
        ),
      );
    });
  }

  void _goDetailPage(GoDetailPageEvent event, Emitter<MovieState> emit) {
    emit(state.copyWith(status: MovieStatus.goDetailPage));
  }

  void _getDataFromHomePageEvent(GetDataFromHomePageEvent event, Emitter<MovieState> emit) {
    emit(state.copyWith(
      movie: event.movie,
      status: MovieStatus.success,
    ));
  }

  void _searchMovie(SearchMovieEvent event, Emitter<MovieState> emit) {
    final searchText = event.text.toLowerCase();
    final List<MovieModel> sourceList = state.dataNowPlaying!.results;

    final List<MovieModel> searchData = searchText.isNotEmpty
        ? sourceList.where((movie) {
            return movie.title.toLowerCase().contains(searchText) || movie.releaseDate.substring(0, 4).toLowerCase().contains(searchText);
          }).toList()
        : [];

    emit(state.copyWith(filterData: searchData));
  }

  // void _getMovieId(GetMovieIdEvent event, Emitter<MovieState> emit) {
  //   final response = repository.getMovies();

  //   if (response != null) {
  //     List<int> movieIds = List<int>.from(jsonDecode(response));
  //     emit(state.copyWith(
  //       ids: movieIds,
  //       status: MovieStatus.success,
  //       dataNowPlaying: state.dataNowPlaying,
  //       dataPopular: state.dataPopular,
  //       dataTopRated: state.dataTopRated,
  //       dataUpcoming: state.dataUpcoming,
  //       filterData: state.filterData,
  //     ));
  //   } else {
  //     emit(state.copyWith(
  //       ids: [],
  //       status: MovieStatus.error,
  //       dataNowPlaying: state.dataNowPlaying,
  //       dataPopular: state.dataPopular,
  //       dataTopRated: state.dataTopRated,
  //       dataUpcoming: state.dataUpcoming,
  //       filterData: state.filterData,
  //     ));
  //   }
  // }

  void _getMovieId(GetMovieIdEvent event, Emitter<MovieState> emit) async {
    final response = await repository.getMovies();

    if (response != null) {
      List<int> movieIds = List<int>.from(jsonDecode(response));
      emit(state.copyWith(
        ids: movieIds,
        status: MovieStatus.success,
        dataNowPlaying: state.dataNowPlaying,
        dataPopular: state.dataPopular,
        dataTopRated: state.dataTopRated,
        dataUpcoming: state.dataUpcoming,
        filterData: state.filterData,
      ));
    } else {
      // Handle the case where no data is returned from the repository
      emit(state.copyWith(
        ids: [], // Empty list if no data available
        status: MovieStatus.error,
        dataNowPlaying: state.dataNowPlaying,
        dataPopular: state.dataPopular,
        dataTopRated: state.dataTopRated,
        dataUpcoming: state.dataUpcoming,
        filterData: state.filterData,
      ));
    }
  }

  // void _storeMovieId(StoreMovieIdEvent event, Emitter<MovieState> emit) async {
  //   // emit(const MovieState(status: MovieStatus.loading));

  //   await repository.storeMovies(event.ids);
  //   emit(
  //     state.copyWith(
  //       ids: event.ids, // Update the state with the stored IDs
  //       status: MovieStatus.successStoreData,
  //       dataNowPlaying: state.dataNowPlaying,
  //       dataPopular: state.dataPopular,
  //       dataTopRated: state.dataTopRated,
  //       dataUpcoming: state.dataUpcoming,
  //       filterData: state.filterData,
  //     ),
  //   );
  // }

  void _storeMovieId(StoreMovieIdEvent event, Emitter<MovieState> emit) async {
    emit(state.copyWith(status: MovieStatus.loading));

    try {
      await repository.storeMovies(event.ids); // Store movie IDs
      emit(
        state.copyWith(
          ids: event.ids, // Update the state with the stored IDs
          status: MovieStatus.successStoreData, // Success state
          dataNowPlaying: state.dataNowPlaying,
          dataPopular: state.dataPopular,
          dataTopRated: state.dataTopRated,
          dataUpcoming: state.dataUpcoming,
          filterData: state.filterData,
        ),
      );
    } catch (e) {
      // In case of any error while storing data
      emit(
        state.copyWith(
          status: MovieStatus.error, // Set an error status
          dataNowPlaying: state.dataNowPlaying,
          dataPopular: state.dataPopular,
          dataTopRated: state.dataTopRated,
          dataUpcoming: state.dataUpcoming,
          filterData: state.filterData,
        ),
      );
    }
  }

  void _isBookmarked(IsBookMarkedEvent event, Emitter<MovieState> emit) async {
    emit(
      state.copyWith(
        isBookmarked: event.isBookmarked,
        dataNowPlaying: state.dataNowPlaying,
        dataPopular: state.dataPopular,
        dataTopRated: state.dataTopRated,
        dataUpcoming: state.dataUpcoming,
        filterData: state.filterData,
      ),
    );
  }
}
