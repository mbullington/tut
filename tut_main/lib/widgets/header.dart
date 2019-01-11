part of tut.widgets;

class Header extends StatelessWidget {
  final ScrollController controller;

  Header({Key key, @required this.controller}): super(key: key);

  void _onTap() {
    controller.animateTo(0, duration: Duration(milliseconds: (2 * controller.offset).toInt()), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: GestureDetector(
        onTap: _onTap,
        child: Text(
          themeTitle,
          style: TFonts.styleLogo
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      brightness: Brightness.light,
    );
  }
}
