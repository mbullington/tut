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
  final String text;
  final Color color = Colors.black87;

  Subtitle(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PaddedText(text,
      style: textTheme.headline.copyWith(color: color),
      padding: EdgeInsets.only(top: 8.0)
    );
  }
}
