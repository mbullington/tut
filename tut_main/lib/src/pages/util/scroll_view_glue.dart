part of tut.pages;

enum ScrollViewGlueType { list, grid }

enum ScrollViewGlueDismissable { none, tactile }

// handles plenty of things that go into the main views of the applications
// handles "header" widgets in the listview, like the subtitles and text fields
// also handles putting dividers between elements
// handles refreshing functionality
// lastly, handles dismissable functionality
class ScrollViewGlue<T extends Unique> extends StatelessWidget {
  final ScrollViewGlueType type;
  final ScrollViewGlueDismissable dismissable;

  final List<Widget> headers;
  final List<T> data;

  final UniqueWidgetBuilder<T> builder;
  final UniqueWidgetBuilder<T> backgroundBuilder;

  final RefreshCallback onRefresh;

  ScrollViewGlue({Key key,
    this.type: ScrollViewGlueType.list,
    this.dismissable: ScrollViewGlueDismissable.tactile,
    @required this.headers,
    @required this.data,
    @required this.builder,
    this.backgroundBuilder,
    @required this.onRefresh})
      : super(key: key);

  Widget _itemBuilder(BuildContext context, int index) {
    final spec = data[index];

    Widget widget = builder(context, spec);
    Widget background = backgroundBuilder != null ? backgroundBuilder(
        context, spec) : null;

    if (this.dismissable == ScrollViewGlueDismissable.tactile) {
      widget = TactileDismissable(
          key: Key("${spec.id}_dismissible"),
          child: widget,
          background: background
      );
    }

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        backgroundColor: BrandColors.red,
        color: BrandColors.bgGray,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: const BouncingScrollPhysics()),
          slivers: <Widget>[
            SliverList(delegate: SliverChildListDelegate(this.headers)),
            SliverPadding(
                padding: EdgeInsets.symmetric(
                    horizontal: type == ScrollViewGlueType.grid ? 16.0 : 0.0) +
                    const EdgeInsets.only(bottom: 16.0),
                sliver: (type == ScrollViewGlueType.grid
                    ? (
                    /* grid */
                    SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            childAspectRatio: 3 / 4),
                        delegate: SliverChildBuilderDelegate(
                            _itemBuilder, childCount: data.length)
                    )
                )
                    : (
                    /* list */
                    SliverList(delegate: SliverChildBuilderDelegate(
                        _itemBuilder, childCount: data.length))
                )
                )
            )
          ],
        )
    );
  }
}
