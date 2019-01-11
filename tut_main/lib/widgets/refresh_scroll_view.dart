part of tut.widgets;

class RefreshScrollView extends StatelessWidget {
  final List<Widget> slivers;
  final RefreshCallback onRefresh;
  final ScrollController controller;

  RefreshScrollView({@required this.slivers, @required this.onRefresh, this.controller, Key key}): super(key: key);
 
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        backgroundColor: TColors.red,
        displacement: 96,
        color: TColors.background,
        child: CustomScrollView(
          physics: kPhysics,
          slivers: slivers,
          controller: controller
        )
    );
  }
}