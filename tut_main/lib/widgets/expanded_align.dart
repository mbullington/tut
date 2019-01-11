part of tut.widgets;

class ExpandedAlign extends StatelessWidget {
  final Alignment alignment;
  final Widget child;

  ExpandedAlign({Key key, @required this.alignment, @required this.child}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: alignment,
        child: child
      )
    );
  }
}
