part of tut.widgets;

class StatusBar extends StatelessWidget {
  final Color color;

  StatusBar({Key key, @required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return SizedBox(
        height: mediaQuery.padding.top,
        width: double.infinity,
        child: DecoratedBox(decoration: BoxDecoration(color: color)));
  }
}
