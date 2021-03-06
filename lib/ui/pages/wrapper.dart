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
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistrationPage)
                    ? SignUpPage(pageState.registrationData)
                    : (pageState is OnPreferencePage)
                        ? PreferencePage(pageState.registrationData)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationData)
                            : (pageState is OnMovieDetailPage)
                                ? MovieDetailPage(pageState.movie)
                                : (pageState is OnSelectSchedulePage)
                                    ? SelectSchedulePage(pageState.movieDetail)
                                    : (pageState is OnSelectSeatPage)
                                        ? SelectSeatPage(pageState.ticket)
                                        : (pageState is OnCheckoutPage)
                                            ? CheckoutPage(pageState.ticket)
                                            : (pageState is OnSuccessPage)
                                                ? SuccessPage(pageState.ticket,
                                                    pageState.transaction)
                                                : (pageState
                                                        is OnTicketDetailPage)
                                                    ? TicketDetailPage(
                                                        pageState.ticket)
                                                    : (pageState
                                                            is OnProfileDetailPage)
                                                        ? ProfileDetailPage()
                                                        : (pageState
                                                                is OnMainPage)
                                                            ? MainPage(
                                                                bottomNavBarIndex:
                                                                    pageState
                                                                        .bottomNavBarIndex,
                                                                isExpired:
                                                                    pageState
                                                                        .isExpired,
                                                              )
                                                            : (pageState
                                                                    is OnEditProfilePage)
                                                                ? EditProfilePage(
                                                                    pageState
                                                                        .users)
                                                                : (pageState
                                                                        is OnTopUpPage)
                                                                    ? TopUpPage(
                                                                        pageState
                                                                            .pageEvent)
                                                                    : (pageState
                                                                            is OnWalletPage)
                                                                        ? WalletPage(
                                                                            pageState.pageEvent)
                                                                        : Container());
  }
}
