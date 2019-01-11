part of tut.widgets;

class CardBackground extends StatelessWidget {
  static final _cardBackgroundColor = alpha12(Colors.black);

  final Color color;

  CardBackground({Key key, this.color}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? _cardBackgroundColor,
        borderRadius: Card.borderRadius
      ),
    );
  }
}
