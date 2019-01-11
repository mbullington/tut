part of tut.widgets;

// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Lifted this from CupertinoTabBar, made it look more Material-y
// Consistent with our cross-platform brand

// Standard Material Design tab bar height.
const double _kTabBarHeight = 56.0;

class BottomNavigation extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a tab bar in the iOS style.
  BottomNavigation({
    Key key,
    @required this.pages,
    this.onTap,
    this.currentIndex: 0,
    this.backgroundColor: Colors.white,
    this.activeColor: TColors.gold,
    this.inactiveColor: Colors.black38,
    this.iconSize: 28.0,
  }) : assert(pages != null),
       assert(pages.length >= 2),
       assert(0 <= currentIndex && currentIndex < pages.length),
       assert(iconSize != null),
       super(key: key);

  final List<Page> pages;

  final ValueChanged<int> onTap;

  final int currentIndex;

  final Color backgroundColor;

  final Color activeColor;
  final Color inactiveColor;

  final double iconSize;

  bool get opaque => backgroundColor.alpha == 0xFF;

  @override
  Size get preferredSize => const Size.fromHeight(_kTabBarHeight);

  List<Widget> _buildTabItems(BuildContext context) {
    final List<Widget> result = <Widget>[];

    final textStyle = Theme.of(context).textTheme.body2;

    for (int index = 0; index < pages.length; index++) {
      final page = pages[index];

      final active = index == currentIndex;
      final iconColor = active ? activeColor : inactiveColor;

      result.add(
        Expanded(
          child: InkResponse(
            containedInkWell: true,
            highlightShape: BoxShape.rectangle,
            onTap: onTap == null ? null : () => onTap(index),
            child: Tooltip(
              message: page.title,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0, left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Center(
                      child: Icon(page.icon, color: iconColor)
                    ),
                    /*
                    PaddedText(page.title,
                      padding: const EdgeInsets.only(top: 2.0),
                      style: textStyle.copyWith(color: iconColor)
                    ),
                    */
                  ],
                ),
              )
            )
          )
        )
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    Widget result = Material(
      color: backgroundColor,
      type: MaterialType.canvas,
      elevation: 8.0,
      child: SizedBox(
        height: _kTabBarHeight + bottomPadding,
        child: Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildTabItems(context),
          ),
        ),
      ),
    );

    return result;
  }
}
