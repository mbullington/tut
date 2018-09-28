part of tut.widgets;

class BasicCardBackground extends StatelessWidget {
  final Color color;

  BasicCardBackground({Key key, @required this.color}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BasicCard.radius
      ),
    );
  }
}
