part of 'pages.dart';

class TopUpPage extends StatefulWidget {
  final PageEvent pageEvent;
  TopUpPage(this.pageEvent);

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  TextEditingController amountController = TextEditingController(text: 'IDR 0');
  int selectedAmount = 0;
  @override
  Widget build(BuildContext context) {
    context
        .read<ThemeBloc>()
        .add(ChangeTheme(ThemeData(primaryColor: accentColorGrey)));

    double cardWidth =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 40) / 3;
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(widget.pageEvent);
        return;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(left: defaultMargin, top: 20),
                    child: GestureDetector(
                      onTap: () {
                        context.read<PageBloc>().add(widget.pageEvent);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text('Top Up',
                          style: blackTextFont.copyWith(fontSize: 20)),
                      SizedBox(height: 30),
                      //TextField
                      TextField(
                        onChanged: (text) {
                          String temp = '';
                          for (int i = 0; i < text.length; i++) {
                            temp += text.isDigit(i) ? text[i] : '';
                          }
                          //ubah string ke integer
                          setState(() {
                            selectedAmount = int.tryParse(temp) ?? 0;
                          });
                          amountController.text = NumberFormat.currency(
                                  locale: 'id_ID',
                                  symbol: 'IDR ',
                                  decimalDigits: 0)
                              .format(selectedAmount);
                          //cursor otomatis dikanan text(terakhir)
                          amountController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: amountController.text.length));
                        },
                        controller: amountController,
                        decoration: InputDecoration(
                            labelText: 'Amount',
                            labelStyle: greyTextFont,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      //choose by template
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 20, bottom: 14),
                          child:
                              Text('Choose by Template', style: blackTextFont),
                        ),
                      ),
                      Wrap(
                        spacing: 19,
                        runSpacing: 14,
                        children: [
                          makeMoneyCard(
                            amount: 50000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 100000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 250000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 500000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 1000000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 2000000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 3000000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 4000000,
                            width: cardWidth,
                          ),
                          makeMoneyCard(
                            amount: 5000000,
                            width: cardWidth,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                          height: 46,
                          width: 250,
                          child: BlocBuilder<UserBloc, UserState>(
                            builder: (_, userState) => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                  primary: (selectedAmount > 0)
                                      ? accentColorGreenTosca
                                      : accentColorGrey,
                                ),
                                child: Text('Top Up My Wallet',
                                    style: whiteTextFont.copyWith(
                                        fontSize: 16,
                                        color: (selectedAmount > 0)
                                            ? Colors.white
                                            : Color(0xffBEBEBE))),
                                onPressed: (selectedAmount > 0)
                                    ? () {
                                        context.read<PageBloc>().add(
                                            GoToSuccessPage(
                                                null,
                                                OntixTransaction(
                                                    userID: (userState
                                                            as UserLoaded)
                                                        .users
                                                        .id,
                                                    title: "Top Up Wallet",
                                                    amount: selectedAmount,
                                                    subtitle:
                                                        "${DateTime.now().dayName}, ${DateTime.now().day} ${DateTime.now().monthName} ${DateTime.now().year}",
                                                    time: DateTime.now())));
                                      }
                                    : null),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  MoneyCard makeMoneyCard({int amount, double width}) {
    return MoneyCard(
      amount: amount,
      width: width,
      isSelected: amount == selectedAmount,
      onTap: () {
        setState(() {
          if (selectedAmount != amount) {
            selectedAmount = amount;
          } else {
            selectedAmount = 0;
          }

          amountController.text = NumberFormat.currency(
                  locale: 'id_ID', decimalDigits: 0, symbol: 'IDR ')
              .format(selectedAmount);

          amountController.selection = TextSelection.fromPosition(
              TextPosition(offset: amountController.text.length));
        });
      },
    );
  }
}
