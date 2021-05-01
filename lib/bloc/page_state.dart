part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class onInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class onLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class onSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class onMainPage extends PageState {
  final int bottomNavBarIndex;
  final bool isExpired;
  onMainPage({this.bottomNavBarIndex = 0, this.isExpired = false});
  @override
  List<Object> get props => [bottomNavBarIndex, isExpired];
}

class onRegistrationPage extends PageState {
  final RegistrationData registrationData;
  onRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class onPreferencePage extends PageState {
  final RegistrationData registrationData;
  onPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

class onAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;
  onAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

class onMovieDetailPage extends PageState {
  final Movie movie;
  onMovieDetailPage(this.movie);
  @override
  List<Object> get props => [movie];
}

class onSelectSchedulePage extends PageState {
  final MovieDetail movieDetail;
  onSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class onSelectSeatPage extends PageState {
  final Ticket ticket;

  onSelectSeatPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class onCheckoutPage extends PageState {
  final Ticket ticket;

  onCheckoutPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class onSuccessPage extends PageState {
  final Ticket ticket;
  final OntixTransaction transaction;

  onSuccessPage(this.ticket, this.transaction);

  @override
  List<Object> get props => [ticket, transaction];
}

class onTicketDetailPage extends PageState {
  final Ticket ticket;
  onTicketDetailPage(this.ticket);

  @override
  List<Object> get props => [ticket];
}

class onProfileDetailPage extends PageState {
  @override
  List<Object> get props => [];
}

class onEditProfilePage extends PageState {
  final Users users;
  onEditProfilePage(this.users);
  @override
  List<Object> get props => [users];
}

class onTopUpPage extends PageState {
  final PageEvent pageEvent;
  onTopUpPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}

class onWalletPage extends PageState {
  final PageEvent pageEvent;

  onWalletPage(this.pageEvent);

  @override
  List<Object> get props => [pageEvent];
}