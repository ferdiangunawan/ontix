part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigninIng = false; //mencatat apakah sedang signIn
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ThemeBloc>(context).add(
        ChangeTheme(ThemeData().copyWith(primaryColor: accentColorYellow)));
    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 70,
                    child: Image.asset("assets/logo2.png"),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 70, bottom: 40),
                      child: Text(
                        "Welcome back,\n Explorer!",
                        style: blackTextFont.copyWith(fontSize: 20),
                      )),
                  TextField(
                    onChanged: (email) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(email);
                      });
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email Address",
                        hintText: "Email Address"),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    onChanged: (password) {
                      setState(() {
                        isPasswordValid = password.length >= 6;
                      });
                    },
                    controller: passwordController,
                    obscureText: true, //tulisan safety
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Password"),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      Text("Forgot password? ",
                          style: greyTextFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400)),
                      Text("Get Now",
                          style: greenTextFont.copyWith(fontSize: 12)),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      child: (isSigninIng)
                          ? SpinKitFadingCircle(color: mainColor)
                          : FloatingActionButton(
                              elevation: 0,
                              backgroundColor: (isEmailValid && isPasswordValid)
                                  ? mainColor
                                  : Color(0xffE4E4E4),
                              onPressed: isEmailValid && isPasswordValid
                                  ? () async {
                                      setState(() {
                                        isSigninIng =
                                            true; //ketika kondisi loading
                                      });
                                      SignInSignUpResult result =
                                          await AuthServices.signIn(
                                              emailController.text,
                                              passwordController.text);
                                      if (result.users == null) {
                                        setState(() {
                                          isSigninIng = false;
                                        });
                                        // untuk push notif error
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: Color(0xffFF5C83),
                                          message: result.message,
                                        )..show(context);
                                      }
                                    }
                                  : null,
                              child: Icon(Icons.arrow_forward,
                                  color: (isEmailValid && isPasswordValid)
                                      ? Colors.white
                                      : Color(0xff828282))),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Start Fresh Now? ',
                      style:
                          greyTextFont.copyWith(fontWeight: FontWeight.w400)),
                  Text(' Sign Up', style: greenTextFont),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
