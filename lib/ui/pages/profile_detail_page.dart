part of 'pages.dart';

class ProfileDetailPage extends StatefulWidget {
  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage(bottomNavBarIndex: 0));
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
              if (userState is UserLoaded) {
                Users users = userState.users;

                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 20, defaultMargin, 30),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                context
                                    .read<PageBloc>()
                                    .add(GoToMainPage(bottomNavBarIndex: 0));
                                return;
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black)),
                        ],
                      ),
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      margin: EdgeInsets.only(top: 35, bottom: 10),
                      child: Stack(
                        children: [
                          SpinKitFadingCircle(
                            size: 50,
                            color: mainColor,
                          ),
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: (users.profilePicture != '')
                                        ? NetworkImage(users.profilePicture)
                                        : AssetImage('assets/user_pic.png'),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                    ),
                    Text(
                      users.name,
                      style: blackTextFont.copyWith(fontSize: 18),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      users.email,
                      style: greyTextFont.copyWith(fontSize: 16),
                    ),
                    SizedBox(height: 30),

                    //Noted : Edit Profile
                    GestureDetector(
                      onTap: () {
                        context
                            .read<PageBloc>()
                            .add(GoToEditProfilePage(users));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: defaultMargin, right: defaultMargin),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image(
                                    image: AssetImage('assets/users.jpg'),
                                    height: 24),
                                SizedBox(width: 10),
                                Text('Edit Profile',
                                    style:
                                        blackTextFont.copyWith(fontSize: 16)),
                              ],
                            ),
                            SizedBox(height: 12),
                            buildDottedLine()
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<PageBloc>()
                            .add(GoToWalletPage(GoToProfileDetailPage()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: defaultMargin, top: 16, right: defaultMargin),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image(
                                    image: AssetImage('assets/ic_wallet.png'),
                                    height: 24),
                                SizedBox(width: 10),
                                Text('My Wallet',
                                    style:
                                        blackTextFont.copyWith(fontSize: 16)),
                              ],
                            ),
                            SizedBox(height: 12),
                            buildDottedLine(),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                            left: defaultMargin, top: 16, right: defaultMargin),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image(
                                    image:
                                        AssetImage('assets/ic_translate.png'),
                                    height: 24),
                                SizedBox(width: 10),
                                Text('Change Language',
                                    style:
                                        blackTextFont.copyWith(fontSize: 16)),
                              ],
                            ),
                            SizedBox(height: 12),
                            buildDottedLine()
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                            left: defaultMargin, top: 16, right: defaultMargin),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image(
                                    image: AssetImage('assets/ic_help.png'),
                                    height: 24),
                                SizedBox(width: 10),
                                Text('Help Center',
                                    style:
                                        blackTextFont.copyWith(fontSize: 16)),
                              ],
                            ),
                            SizedBox(height: 12),
                            buildDottedLine()
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(
                            left: defaultMargin, top: 16, right: defaultMargin),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image(
                                    image:
                                        AssetImage('assets/ic_thumbs_up.png'),
                                    height: 24),
                                SizedBox(width: 10),
                                Text('Rate OnTix App',
                                    style:
                                        blackTextFont.copyWith(fontSize: 16)),
                              ],
                            ),
                            SizedBox(height: 12),
                            buildDottedLine()
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              primary: accentColorRed),
                          onPressed: () async {
                            AuthServices.signOut();
                          },
                          child: Text("Sign Out",
                              style: whiteTextFont.copyWith(fontSize: 16))),
                    )
                  ],
                );
              } else {
                return SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }

  DottedLine buildDottedLine() {
    return DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 1,
      dashColor: Color(0xffE4E4E4),
      dashGapLength: 3,
      dashRadius: 0.0,
    );
  }
}
