part of tut.widgets;

// doesn't allow for overflow (as of right now)
class InfiniteRowBuilder extends StatelessWidget {
  final double itemWidth;
  final double itemSpacing;

  final double limit;

  final IndexedWidgetBuilder builder;

  InfiniteRowBuilder({Key key,
      @required this.itemWidth,
      @required this.itemSpacing,
      @required this.builder,
      this.limit: double.infinity})
      : super(key: key);

  Widget _rowBuilder(BuildContext context, BoxConstraints size) {
    final List<Widget> children = <Widget>[];
    
    double width = size.maxWidth;
    int i = 0;

    while (width > itemWidth) {
      if (i >= limit) {
        break;
      }
      
      width -= itemWidth;

      Widget widget = builder(context, i);

      if (width > itemSpacing) {
        widget = Padding(padding: EdgeInsets.only(right: itemSpacing), child: widget);
      }

      width -= itemSpacing;

      children.add(widget);
      i++;
    }

    return Row(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: _rowBuilder);
  }
}
