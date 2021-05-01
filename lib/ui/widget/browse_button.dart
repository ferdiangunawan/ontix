part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;
  BrowseButton(this.genre);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Color(0xffEBEFF6),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage(getBrowseImage(genre)),
                  fit: BoxFit.contain)),
        ),
        SizedBox(
          height: 4,
        ),
        Text(genre, style: blackTextFont.copyWith(fontSize: 12)),
      ],
    );
  }

  String getBrowseImage(String genre) {
    switch (genre) {
      case "Horror":
        return "assets/ic_horror.png";
        break;
      case "Action":
        return "assets/ic_action.png";
        break;
      case "Comedy":
        return "assets/ic_comedy.png";
        break;
      case "Crime":
        return "assets/ic_crime.png";
        break;
      case "War":
        return "assets/ic_war.png";
        break;
      case "Drama":
        return "assets/ic_drama.png";
        break;
      default:
        return "";
    }
  }
}
