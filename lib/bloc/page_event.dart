part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  /// notify change state without deep clone state
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  //navBarIndex dan ticket
  final int bottomNavBarIndex;
  final bool isExpired;
  GoToMainPage({this.bottomNavBarIndex = 0, this.isExpired = false});
  @override
  List<Object> get props => [bottomNavBarIndex, isExpired];
}

class GoToRegistrationDpage extends PageEvent {
  final RegistrationData registrationData;
  GoToRegistrationDpage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;
  GoToPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;
  GoToAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToMovieDetailPage extends PageEvent {
  final Movie movie;
  GoToMovieDetailPage(this.movie);
  @override
  List<Object> get props => [movie];
}

class GoToSelectSchedulePage extends PageEvent {
  final MovieDetail movieDetail;
  GoToSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class GoToSelectSeatPage extends PageEvent {
  final Ticket ticket;

  GoToSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToCheckoutPage extends PageEvent {
  final Ticket ticket;

  GoToCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToSuccessPage extends PageEvent {
  final Ticket ticket;
  final OntixTransaction transaction;

  GoToSuccessPage(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}

class GoToTicketDetailPage extends PageEvent {
  final Ticket ticket;
  GoToTicketDetailPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class GoToProfileDetailPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToEditProfilePage extends PageEvent {
  final Users users;
  GoToEditProfilePage(this.users);
  @override
  List<Object> get props => [users];
}

class GoToTopUpPage extends PageEvent {
  final PageEvent pageEvent;
  GoToTopUpPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class GoToWalletPage extends PageEvent {
  final PageEvent pageEvent;

  GoToWalletPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}