import "package:flutter/material.dart";

import "package:transformer_page_view/transformer_page_view.dart";

import "theme.dart";
import "widgets.dart";

// adds scaffolding, bottom navigation bar
// and allows for child views to be mutated
class Home extends StatefulWidget {
  Home();

  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  final IndexController controller = IndexController();
  int _currentIndex = 0;

  final List<Page> pages = [
    MyRequestsPage(),
    RequestsPage(),
    MessagesPage(),
    AccountPage()
  ];

  void _onTap(int index) => controller.move(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.gold,
      body: TransformerPageView.children(
        transformer: ZoomOutPageTransformer(),
        controller: controller,
        children: pages,
        physics: kPhysics,
        onPageChanged: (newIndex) => setState(() {
          _currentIndex = newIndex;
        })
      ),
      bottomNavigationBar: BottomNavigation(
        pages: pages,
        currentIndex: _currentIndex,
        onTap: _onTap
      ),
    );
  }
}