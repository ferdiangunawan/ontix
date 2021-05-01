part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  /// notify change state without deep clone state
  const MovieEvent();
}

class FetchMovie extends MovieEvent {
  @override
  List<Object> get props => [];
}
