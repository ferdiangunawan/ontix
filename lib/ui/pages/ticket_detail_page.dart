part of 'pages.dart';

class TicketDetailPage extends StatelessWidget {
  final Ticket ticket;
  TicketDetailPage(this.ticket);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage(
            bottomNavBarIndex: 1,
            isExpired: ticket.dateTime.isBefore(DateTime.now())));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Color(0xffF6F7F9),
          child: SafeArea(
            child: ListView(
              children: [
                Container(
                  color: Color(0xffF6F7F9),
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 24,
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: Stack(
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  context.read<PageBloc>().add(GoToMainPage(
                                      bottomNavBarIndex: 1,
                                      isExpired: ticket.dateTime
                                          .isBefore(DateTime.now())));
                                },
                                child: Icon(Icons.arrow_back,
                                    color: Colors.black)),
                            Center(
                              child: Text(
                                "Ticket Details",
                                style: blackTextFont.copyWith(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                      ClipPath(
                        clipper: TicketClipper(),
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 560,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 16),
                                  height: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                          image: NetworkImage(imageBaseUrl +
                                              "w780" +
                                              ticket.movieDetail.posterPath),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ticket.movieDetail.title,
                                        style: blackTextFont.copyWith(
                                            fontSize: 20),
                                      ),
                                      SizedBox(height: 6),
                                      Text(ticket.movieDetail.genreAndLanguage,
                                          style: greyTextFont.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                      SizedBox(height: 6),
                                      RatingStars(
                                        colorAngka: accentColorGrey,
                                        voteAverage:
                                            ticket.movieDetail.voteAverage,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 18),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Cinema",
                                                    style:
                                                        greyTextFont.copyWith(
                                                            fontSize: 16)),
                                                Text(ticket.theater.name,
                                                    style: whiteNumberFont
                                                        .copyWith(
                                                            color: Colors.black,
                                                            fontSize: 16))
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Date Time",
                                                    style:
                                                        greyTextFont.copyWith(
                                                            fontSize: 16)),
                                                Text(
                                                    ticket
                                                        .dateTime.shortDateTime,
                                                    style: whiteNumberFont
                                                        .copyWith(
                                                            color: Colors.black,
                                                            fontSize: 16))
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  "Seat Number",
                                                  style: greyTextFont.copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.40,
                                                  child: Text(
                                                    ticket.seatInString,
                                                    textAlign: TextAlign.end,
                                                    style: whiteNumberFont
                                                        .copyWith(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("ID Order",
                                                    style:
                                                        greyTextFont.copyWith(
                                                            fontSize: 16)),
                                                Text(ticket.bookingCode,
                                                    style: whiteNumberFont
                                                        .copyWith(
                                                            color: Colors.black,
                                                            fontSize: 16))
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //Divider dotted_line
                                Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 18),
                                  child: DottedLine(
                                    direction: Axis.horizontal,
                                    lineLength: double.infinity,
                                    lineThickness: 1.0,
                                    dashLength: 7.0,
                                    dashColor: accentColorGrey,
                                    dashGapLength: 5,
                                    dashRadius: 10,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: defaultMargin),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Name',
                                              style: greyTextFont.copyWith(
                                                  fontSize: 16)),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(ticket.name,
                                              style: blackTextFont.copyWith(
                                                  fontSize: 16)),
                                          SizedBox(height: 8),
                                          Text("Paid",
                                              style: greyTextFont.copyWith(
                                                  fontSize: 16)),
                                          SizedBox(height: 2),
                                          Text(NumberFormat.currency(
                                                  locale: 'id_ID',
                                                  decimalDigits: 0,
                                                  symbol: "IDR ")
                                              .format(ticket.totalPrice))
                                        ],
                                      ),
                                      //QR_Image
                                      QrImage(
                                        data: ticket.bookingCode,
                                        version: 6, //auto jg bisa
                                        errorCorrectionLevel:
                                            QrErrorCorrectLevel.M,
                                        foregroundColor: Colors.black,
                                        size: 100.0,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  double x = 155.0;
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height - x - 13);
    path.quadraticBezierTo(13, size.height - x - 13, 13, size.height - x);
    path.quadraticBezierTo(13, size.height - x + 13, 0, size.height - x + 13);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - x + 13);
    path.quadraticBezierTo(size.width - 13, size.height - x + 13,
        size.width - 13, size.height - x);
    path.quadraticBezierTo(size.width - 13, size.height - x - 13, size.width,
        size.height - x - 13);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
