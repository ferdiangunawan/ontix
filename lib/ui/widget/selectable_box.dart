part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final bool isSelected;
  final bool isEnabled;
  final double height;
  final double width;
  final String text;
  final Function onTap;
  final TextStyle textStyle;

  SelectableBox(this.text,
      {this.isSelected = false,
      this.isEnabled = true,
      this.height = 60,
      this.width = 144,
      this.onTap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: (!isEnabled)
                ? Color(0xffF6F6F6)
                : isSelected
                    ? accentColorYellow
                    : Colors.transparent,
            border: Border.all(
                color: (!isEnabled)
                    ? Colors.transparent
                    : isSelected
                        ? Colors.transparent
                        : accentColorGrey),
          ),
          child: Center(
            child: Text((text) ?? "none",
                style: ((textStyle ?? blackTextFont)
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400))),
          )),
    );
  }
}
