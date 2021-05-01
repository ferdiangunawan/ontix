part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int bottomNavBarIndex;
  final bool isExpired;

  MainPage({this.bottomNavBarIndex = 0, this.isExpired = false});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  static TextStyle optionStyle =
      GoogleFonts.raleway(fontSize: 13, fontWeight: FontWeight.w600);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'New Movies',
      style: optionStyle,
    ),
    Text(
      'Tickets',
      style: optionStyle,
    ),
  ];

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = widget.bottomNavBarIndex;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          //combine style dengan bottomnavbarText
          Center(child: _widgetOptions.elementAt(bottomNavBarIndex)),
          //warna statusbar
          Container(color: accentColorGreenDark),
          //safearea supaya dluar statusbar
          SafeArea(
            bottom: false,
            child: Container(
              color: Color(0xffF6F7F9),
            ),
          ),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: <Widget>[
              MoviePage(),
              TicketPage(
                isExpiredTicket: widget.isExpired,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: BottomNavBarClipper(),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: BottomNavigationBar(
                    onTap: (index) {
                      setState(() {
                        bottomNavBarIndex = index;
                        pageController.jumpToPage(index);
                      });
                    },
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    selectedItemColor: mainColor,
                    unselectedItemColor: Color(0xffE5E5E5),
                    currentIndex: bottomNavBarIndex,
                    items: [
                      BottomNavigationBarItem(
                          label: "New Movies",
                          icon: Container(
                            margin: EdgeInsets.only(bottom: 6),
                            height: 20,
                            child: Image.asset((bottomNavBarIndex == 0)
                                ? "assets/ic_movies.png"
                                : "assets/ic_movies_grey.png"),
                          )),
                      BottomNavigationBarItem(
                          label: "Tickets",
                          icon: Container(
                            margin: EdgeInsets.only(bottom: 6),
                            height: 20,
                            child: Image.asset((bottomNavBarIndex == 1)
                                ? "assets/ic_tickets.png"
                                : "assets/ic_tickets_grey.png"),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 46,
                  width: 46,
                  margin: EdgeInsets.only(bottom: 42),
                  child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: accentColorYellow,
                    child: SizedBox(
                      height: 26,
                      width: 26,
                      child: Icon(MdiIcons.walletPlus,
                          color: Colors.black.withOpacity(0.54)),
                    ),
                    onPressed: () {
                      //topup page mengembalikan pageEvent supaya balik ke mainpage
                      context
                          .read<PageBloc>()
                          .add(GoToTopUpPage(GoToMainPage()));
                    },
                  ))),
        ],
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
