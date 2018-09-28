part of tut.widgets;

class Header extends StatelessWidget {
  static const double widgetHeight = 72.0;
  static const EdgeInsets widgetPadding =
      EdgeInsets.only(left: 8.0, right: 8.0);

  void _onAccountPressed() {

  }

  void _onSettingsPressed() {

  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
        height: widgetHeight + mediaQuery.padding.top,
        padding: widgetPadding + EdgeInsets.only(top: mediaQuery.padding.top),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              tooltip: "Account",
              onPressed: _onAccountPressed,
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  Brand.title,
                  style: BrandTypography.styleLogo
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: "Settings",
              onPressed: _onSettingsPressed,
            ),
          ],
        ));
  }
}
