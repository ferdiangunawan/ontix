part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    if (user == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.watch<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        BlocProvider.of<UserBloc>(context).add(LoadUser(user.uid));
        BlocProvider.of<TicketBloc>(context).add(GetTicket(user.uid));
        prevPageEvent = GoToMainPage();
        context.watch<PageBloc>().add(prevPageEvent);
      }
    }
    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is onSplashPage)
            ? SplashPage()
            : (pageState is onLoginPage)
                ? SignInPage()
                : (pageState is onRegistrationPage)
                    ? SignUpPage(pageState.registrationData)
                    : (pageState is onPreferencePage)
                        ? PreferencePage(pageState.registrationData)
                        : (pageState is onAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationData)
                            : (pageState is onMovieDetailPage)
                                ? MovieDetailPage(pageState.movie)
                                : (pageState is onSelectSchedulePage)
                                    ? SelectSchedulePage(pageState.movieDetail)
                                    : (pageState is onSelectSeatPage)
                                        ? SelectSeatPage(pageState.ticket)
                                        : (pageState is onCheckoutPage)
                                            ? CheckoutPage(pageState.ticket)
                                            : (pageState is onSuccessPage)
                                                ? SuccessPage(pageState.ticket,
                                                    pageState.transaction)
                                                : (pageState
                                                        is onTicketDetailPage)
                                                    ? TicketDetailPage(
                                                        pageState.ticket)
                                                    : (pageState
                                                            is onProfileDetailPage)
                                                        ? ProfileDetailPage()
                                                        : (pageState
                                                                is onMainPage)
                                                            ? MainPage(
                                                                bottomNavBarIndex:
                                                                    pageState
                                                                        .bottomNavBarIndex,
                                                                isExpired:
                                                                    pageState
                                                                        .isExpired,
                                                              )
                                                            : (pageState
                                                                    is onEditProfilePage)
                                                                ? EditProfilePage(
                                                                    pageState
                                                                        .users)
                                                                : (pageState
                                                                        is onTopUpPage)
                                                                    ? TopUpPage(
                                                                        pageState
                                                                            .pageEvent)
                                                                    : (pageState
                                                                            is onWalletPage)
                                                                        ? WalletPage(
                                                                            pageState.pageEvent)
                                                                        : Container());
  }
}
