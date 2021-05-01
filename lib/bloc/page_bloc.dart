import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ontix/models/models.dart';
import 'package:ontix/ui/pages/pages.dart';

part 'page_state.dart';
part 'page_event.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc(PageState initialState) : super(initialState);

  @override
  PageState get initialState => onInitialPage();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield onSplashPage();
    } else if (event is GoToLoginPage) {
      yield onLoginPage();
    } else if (event is GoToMainPage) {
      yield onMainPage(
          bottomNavBarIndex: event.bottomNavBarIndex,
          isExpired: event.isExpired);
    } else if (event is GoToRegistrationDpage) {
      yield onRegistrationPage(event.registrationData);
    } else if (event is GoToPreferencePage) {
      yield onPreferencePage(event.registrationData);
    } else if (event is GoToAccountConfirmationPage) {
      yield onAccountConfirmationPage(event.registrationData);
    } else if (event is GoToMovieDetailPage) {
      yield onMovieDetailPage(event.movie);
    } else if (event is GoToSelectSchedulePage) {
      yield onSelectSchedulePage(event.movieDetail);
    } else if (event is GoToSelectSeatPage) {
      yield onSelectSeatPage(event.ticket);
    } else if (event is GoToCheckoutPage) {
      yield onCheckoutPage(event.ticket);
    } else if (event is GoToSuccessPage) {
      yield onSuccessPage(event.ticket, event.transaction);
    } else if (event is GoToTicketDetailPage) {
      yield onTicketDetailPage(event.ticket);
    } else if (event is GoToProfileDetailPage) {
      yield onProfileDetailPage();
    } else if (event is GoToEditProfilePage) {
      yield onEditProfilePage(event.users);
    } else if (event is GoToTopUpPage) {
      yield onTopUpPage(event.pageEvent);
    } else if (event is GoToWalletPage) {
      yield onWalletPage(event.pageEvent);
    }
  }
}
