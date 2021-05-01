part of 'widgets.dart';

class CreditCard extends StatelessWidget {
  final Credit credits;
  CreditCard(this.credits);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 80,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: (credits.profilPath == null)
                ? null
                : DecorationImage(
                    image: NetworkImage(
                        imageBaseUrl + "w185" + credits.profilPath),
                    fit: BoxFit.cover)),
      ),
      Container(
        margin: EdgeInsets.only(top: 6),
        width: 70,
        child: Text(
          credits.name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.clip,
          style:
              blackTextFont.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
        ),
      ),
    ]);
  }
}
