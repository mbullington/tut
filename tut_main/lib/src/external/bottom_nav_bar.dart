// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Lifted this from CupertinoTabBar, made it look more Material-y
// Consistent with our cross-platform brand

import "package:flutter/material.dart";

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import "../../widgets.dart" show BrandColors;


// Standard Material Design tab bar height.
const double _kTabBarHeight = 56.0;

const Color _kDefaultTabBarBackgroundColor = Colors.white;

/// An iOS-styled bottom navigation tab bar.
///
/// Displays multiple tabs using [BottomNavigationBarItem] with one tab being
/// active, the first tab by default.
///
/// This [StatelessWidget] doesn't store the active tab itself. You must
/// listen to the [onTap] callbacks and call `setState` with a new [currentIndex]
/// for the new selection to reflect.
///
/// Tab changes typically trigger a switch between [Navigator]s, each with its
/// own navigation stack, per standard iOS design.
///
/// If the given [backgroundColor]'s opacity is not 1.0 (which is the case by
/// default), it will produce a blurring effect to the content behind it.
///
/// See also:
///
///  * [CupertinoTabScaffold], which hosts the [BrandBottomNavBar] at the bottom.
///  * [BottomNavigationBarItem], an item in a [BrandBottomNavBar].
class BrandBottomNavBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a tab bar in the iOS style.
  BrandBottomNavBar({
    Key key,
    @required this.items,
    this.onTap,
    this.currentIndex: 0,
    this.backgroundColor: _kDefaultTabBarBackgroundColor,
    this.activeColor: BrandColors.golden,
    this.inactiveColor: Colors.black38,
    this.iconSize: 36.0,
  }) : assert(items != null),
       assert(items.length >= 2),
       assert(0 <= currentIndex && currentIndex < items.length),
       assert(iconSize != null),
       super(key: key);

  /// The interactive items laid out within the bottom navigation bar.
  final List<BottomNavigationBarItem> items;

  /// The callback that is called when a item is tapped.
  ///
  /// The widget creating the bottom navigation bar needs to keep track of the
  /// current index and call `setState` to rebuild it with the newly provided
  /// index.
  final ValueChanged<int> onTap;

  /// The index into [items] of the current active item.
  final int currentIndex;

  /// The background color of the tab bar. If it contains transparency, the
  /// tab bar will automatically produce a blurring effect to the content
  /// behind it.
  final Color backgroundColor;

  /// The foreground color of the icon and title for the [BottomNavigationBarItem]
  /// of the selected tab.
  final Color activeColor;

  /// The foreground color of the icon and title for the [BottomNavigationBarItem]s
  /// in the unselected state.
  final Color inactiveColor;

  /// The size of all of the [BottomNavigationBarItem] icons.
  ///
  /// This value is used to to configure the [IconTheme] for the navigation
  /// bar. When a [BottomNavigationBarItem.icon] widget is not an [Icon] the widget
  /// should configure itself to match the icon theme's size and color.
  final double iconSize;

  /// True if the tab bar's background color has no transparency.
  bool get opaque => backgroundColor.alpha == 0xFF;

  @override
  Size get preferredSize => const Size.fromHeight(_kTabBarHeight);

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    Widget result = new Material(
      color: backgroundColor,
      type: MaterialType.canvas,
      elevation: 8.0,
      // TODO(xster): allow icons-only versions of the tab bar too.
      child: new SizedBox(
        height: _kTabBarHeight + bottomPadding,
        child: IconTheme.merge( // Default with the inactive state.
          data: new IconThemeData(
            color: inactiveColor,
            size: iconSize,
          ),
          child: new DefaultTextStyle( // Default with the inactive state.
            style: Theme.of(context).textTheme.body2,
            child: new Padding(
              padding: new EdgeInsets.only(bottom: bottomPadding),
              child: new Row(
                // Align bottom since we want the labels to be aligned.
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _buildTabItems(),
              ),
            ),
          ),
        ),
      ),
    );

    return result;
  }

  List<Widget> _buildTabItems() {
    final List<Widget> result = <Widget>[];

    for (int index = 0; index < items.length; index += 1) {
      result.add(
        _wrapActiveItem(
          new Expanded(child: InkResponse(
              radius: 48.0,
              containedInkWell: false,
              onTap: onTap == null ? null : () { onTap(index); },
              child: new Padding(
                padding: const EdgeInsets.only(bottom: 4.0, left: 24.0, right: 24.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget> [
                    new Expanded(child: new Center(child: items[index].icon)),
                    items[index].title,
                  ],
                ),
              )
          )),
          active: index == currentIndex,
        ),
      );
    }

    return result;
  }

  /// Change the active tab item's icon and title colors to active.
  Widget _wrapActiveItem(Widget item, { bool active }) {
    if (!active)
      return item;

    return IconTheme.merge(
      data: new IconThemeData(color: activeColor),
      child: DefaultTextStyle.merge(
        style: new TextStyle(color: activeColor),
        child: item,
      ),
    );
  }

  /// Create a clone of the current [BrandBottomNavBar] but with provided
  /// parameters overridden.
  BrandBottomNavBar copyWith({
    Key key,
    List<BottomNavigationBarItem> items,
    Color backgroundColor,
    Color activeColor,
    Color inactiveColor,
    Size iconSize,
    int currentIndex,
    ValueChanged<int> onTap,
  }) {
    return new BrandBottomNavBar(
       key: key ?? this.key,
       items: items ?? this.items,
       backgroundColor: backgroundColor ?? this.backgroundColor,
       activeColor: activeColor ?? this.activeColor,
       inactiveColor: inactiveColor ?? this.inactiveColor,
       iconSize: iconSize ?? this.iconSize,
       currentIndex: currentIndex ?? this.currentIndex,
       onTap: onTap ?? this.onTap,
    );
  }
}
