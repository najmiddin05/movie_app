part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

class GetAllDataEvent extends MovieEvent {
  const GetAllDataEvent();

  @override
  List<Object> get props => [];
}

class GoDetailPageEvent extends MovieEvent {
  const GoDetailPageEvent();

  @override
  List<Object> get props => [];
}

class GetDataFromHomePageEvent extends MovieEvent {
  const GetDataFromHomePageEvent({required this.movie});

  final MovieModel? movie;

  @override
  List<Object?> get props => [movie];
}

class SearchMovieEvent extends MovieEvent {
  const SearchMovieEvent({required this.text});

  final String text;

  @override
  List<Object?> get props => [text];
}

class StoreMovieIdEvent extends MovieEvent {
  const StoreMovieIdEvent({required this.ids});

  final List<int> ids;

  @override
  List<Object?> get props => [ids];
}

class GetMovieIdEvent extends MovieEvent {
  const GetMovieIdEvent();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class IsBookMarkedEvent extends MovieEvent {
  IsBookMarkedEvent({required this.isBookmarked});
  bool isBookmarked;

  @override
  List<Object?> get props => [isBookmarked];
}
