import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

import "package:transformer_page_view/transformer_page_view.dart";

import "dart:math" as Math;

import "theme.dart";
import "widgets.dart";

const _kPhysics = const AlwaysScrollableScrollPhysics(parent: const BouncingScrollPhysics());

// adds scaffolding, bottom navigation bar
// and allows for child views to be mutated

// based off of transformer_page_view
// https://github.com/best-flutter/transformer_page_view
class ZoomOutPageTransformer extends PageTransformer {
  static const double MIN_SCALE = 0.94;
  static const double MIN_ALPHA = 0.9;

  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    double pageWidth = info.width;
    double pageHeight = info.height;

    if (position < -1) {
      // This page is way off-screen to the left.
    } else if (position <= 1) {
      // Modify the default slide transition to
      // shrink the page as well
      double scaleFactor = Math.max(MIN_SCALE, 1 - position.abs());
      double vertMargin = pageHeight * (1 - scaleFactor) / 2;
      double horzMargin = pageWidth * (1 - scaleFactor) / 2;
      double dx;
      if (position < 0) {
        dx = (horzMargin - vertMargin / 2);
      } else {
        dx = (-horzMargin + vertMargin / 2);
      }
      // Scale the page down (between MIN_SCALE and 1)
      double opacity = MIN_ALPHA + (scaleFactor - MIN_SCALE) / (1 - MIN_SCALE) * (1 - MIN_ALPHA);

      return Opacity(
        opacity: opacity,
        child: Transform.translate(
          offset: Offset(dx, 0.0),
          child: Transform.scale(
            scale: scaleFactor,
            child: child,
            alignment: Alignment.bottomCenter,
          ),
        ),
      );
    } else {
      // This page is way off-screen to the right.
    }

    return child;
  }
}

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
        physics: _kPhysics,
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