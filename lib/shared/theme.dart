part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = Color(0xff237373);
Color accentColorYellow = Color(0xffFBD460);
Color accentColorGreenDark = Color(0xff1A5555);
Color accentColorGreenTosca = Color(0xff25D2D2);
Color accentColorRed = Color(0xffFF5C83);
Color accentColorGrey = Color(0xffBEBEBE);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle greenTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColorGrey, fontWeight: FontWeight.w500);

//font angka
TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle yellowNumberFont =
    GoogleFonts.openSans().copyWith(color: accentColorYellow);
