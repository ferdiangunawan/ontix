part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 136,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo2.png"),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                "New Experience",
                style: blackTextFont.copyWith(fontSize: 20),
              ),
            ),
            Text(
              "Watch a new movie much\neasier than any before",
              style: greyTextFont.copyWith(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Container(
                height: 46,
                width: 250,
                margin: EdgeInsets.only(top: 70, bottom: 19),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        primary: mainColor,
                        onPrimary: accentColorGreenDark),
                    child: Text("Let's Get Started",
                        style: whiteTextFont.copyWith(fontSize: 16)),
                    onPressed: () {
                      context
                          .read<PageBloc>()
                          .add(GoToRegistrationDpage(RegistrationData()));
                    })),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account?",
                    style: greyTextFont.copyWith(fontWeight: FontWeight.w400)),
                SizedBox(width: 6),
                GestureDetector(
                    onTap: () {
                      context.read<PageBloc>().add(GoToLoginPage());
                    },
                    child: Text("Sign In", style: greenTextFont)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
