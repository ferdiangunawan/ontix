part of 'pages.dart';

class SuccessPage extends StatelessWidget {
  final Ticket ticket;
  final OntixTransaction transaction;

  SuccessPage(this.ticket, this.transaction);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //cant back
      onWillPop: () {
        return;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder(
              future: ticket != null
                  ? proccessingTicketOrder(context)
                  : processingTopUp(context),
              builder: (_, snapshot) => (snapshot.connectionState ==
                      ConnectionState.done)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 86, bottom: 70),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ticket != null
                                        ? "assets/ic_ticket_success.png"
                                        : "assets/card_topup.png"))),
                          ),
                        ),
                        Text(
                          ticket != null ? "Happy Watching !" : "Emmm Yummy !",
                          style: blackTextFont.copyWith(fontSize: 20),
                        ),
                        SizedBox(height: 16),
                        Text(
                            ticket != null
                                ? "You have successfully\nbought the ticket"
                                : "You have successfully\ntop up the wallet",
                            textAlign: TextAlign.center,
                            style: greyTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w300)),
                        Container(
                          height: 45,
                          width: 250,
                          margin: EdgeInsets.only(top: 70, bottom: 20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              onPressed: () {},
                              child: Text(ticket != null
                                  ? "My Tickets"
                                  : "My Wallets")),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Discover new movie? ",
                                style: greyTextFont.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                            GestureDetector(
                              onTap: () {
                                context.read<PageBloc>().add(GoToMainPage());
                              },
                              child: Text(
                                "Back to Home",
                                style: greyTextFont.copyWith(
                                    color: accentColorGreenDark,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  : Center(
                      child: SpinKitFadingCircle(
                        size: 50,
                        color: mainColor,
                      ),
                    ))),
    );
  }

  Future<void> proccessingTicketOrder(BuildContext context) async {
    BlocProvider.of<UserBloc>(context).add(Purchase(ticket.totalPrice));
    BlocProvider.of<TicketBloc>(context)
        .add(BuyTicket(ticket, transaction.userID));

    await OntixTransactionService.saveTransaction(transaction);
  }

  Future<void> processingTopUp(BuildContext context) async {
    context.read<UserBloc>().add(TopUp(transaction.amount));

    await OntixTransactionService.saveTransaction(transaction);
  }
}
