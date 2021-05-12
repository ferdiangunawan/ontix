import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ontix/models/models.dart';
import 'package:ontix/services/services.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(UserState initialState) : super(initialState);

  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      Users users = await UserServices.getUser(event.id);
      yield UserLoaded(users);
    } else if (event is SignOut) {
      yield UserInitial();
    } else if (event is UpdateData) {
      Users updatedUser = (state as UserLoaded)
          .users
          .copyWith(name: event.name, profilePicture: event.profileImage);

      await UserServices.updateUser(updatedUser);
      yield UserLoaded(updatedUser);
    } else if (event is TopUp) {
      if (state is UserLoaded) {
        try {
          Users updateUser = (state as UserLoaded).users.copyWith(
              balance: (state as UserLoaded).users.balance + event.amount);

          await UserServices.updateUser(updateUser);
          yield UserLoaded(updateUser);
        } catch (e) {
          print(e);
        }
      }
    } else if (event is Purchase) {
      if (state is UserLoaded) {
        try {
          Users updateUser = (state as UserLoaded).users.copyWith(
              balance: (state as UserLoaded).users.balance - event.amount);

          await UserServices.updateUser(updateUser);
          yield UserLoaded(updateUser);
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
