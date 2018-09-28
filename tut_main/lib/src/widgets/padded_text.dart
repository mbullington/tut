part of tut.widgets;

class PaddedText extends StatelessWidget {
  final String text;
  final TextStyle style;

  final TextOverflow overflow;
  final int maxLines;

  final EdgeInsets padding;

  PaddedText(this.text,
      {Key key, this.style, this.padding, this.maxLines, this.overflow: TextOverflow
          .ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: Text(text, style: style, overflow: overflow, maxLines: maxLines));
  }
}

class Subtitle extends StatelessWidget {
  static const EdgeInsets widgetPadding =
  EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0);

  final String text;

  Subtitle(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddedText(text,
        style: Theme
            .of(context)
            .textTheme
            .headline,
        padding: widgetPadding);
  }
}
