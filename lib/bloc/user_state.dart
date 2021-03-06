part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

/// Initialized
class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final Users users;

  UserLoaded(this.users);
  List<Object> get props => [users];
}
