part of tut.widgets;

class MiniPill extends StatelessWidget {
  static const double widgetHeight = 22.0;

  static const EdgeInsets widgetPadding =
      EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0);

  final String text;

  MiniPill(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.body2;

    return Container(
        height: widgetHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widgetHeight / 2),
            color: alpha12(textStyle.color)),
        padding: widgetPadding,
        child: Text(text, style: textStyle));
  }
}

class DateMiniPill extends MiniPill {
  DateMiniPill(DateTime date, {Key key}): super(RelativeDateFormat.from(date), key: key);
}