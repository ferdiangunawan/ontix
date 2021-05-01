part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double fontSize;
  final double starSize;
  final Color colorAngka;
  final MainAxisAlignment alignmentRow;

  RatingStars(
      {this.voteAverage = 0,
      this.fontSize = 12,
      this.starSize = 20,
      this.colorAngka,
      this.alignmentRow = MainAxisAlignment.start});
  @override
  Widget build(BuildContext context) {
    //int n = voteAverage ~/ 2; -> ~/ adalah dibagi 2 sisa angkanya dihilangkan
    int n = (voteAverage / 2).round(); // dbagi2 lalu dibulatkan
    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              index < n ? MdiIcons.star : MdiIcons.starOutline,
              color: accentColorYellow,
              size: starSize,
            ));

    widgets.add(SizedBox(width: 3)); //kasih jarak rating ke angka rating
    widgets.add(Text("$voteAverage/10",
        style: whiteNumberFont.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w300,
            color: colorAngka))); 
    return Row(
      children: widgets,
      mainAxisAlignment: alignmentRow,
    );
  }
}
