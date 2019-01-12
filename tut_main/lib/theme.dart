import "package:flutter/material.dart";
import "package:flutter/foundation.dart";
import "package:flutter/services.dart";

const String themeTitle = "tut.";

const SystemUiOverlayStyle themeOverlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: TColors.primaryColor,
    systemNavigationBarDividerColor: null,
    statusBarColor: null,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness:  Brightness.dark);

class TColors {
  // Primary, accent, and background colors.
  static const Color primaryColor = blue;
  static const Color accentColor = gold;
  static const Color background = lightGray;

  // Actual color codes.
  static const Color blue = const Color.fromRGBO(58, 181, 229, 1.0);
  static const Color purple = const Color.fromRGBO(66, 0, 57, 1.0);
  static const Color gold = const Color.fromRGBO(232, 197, 71, 1.0);
  static const Color red = const Color.fromRGBO(206, 45, 79, 1.0);
  static const Color lightGray = const Color.fromRGBO(255, 247, 248, 1.0);
}

// 0.12 alpha
Color alpha12(Color color) => color.withAlpha(31);
// 0.26 alpha
Color alpha26(Color color) => color.withAlpha(66);
// 0.38 alpha
Color alpha38(Color color) => color.withAlpha(97);
// 0.45 alpha
Color alpha45(Color color) => color.withAlpha(115);
// 0.54 alpha
Color alpha54(Color color) => color.withAlpha(138);
// 0.87 alpha
Color alpha87(Color color) => color.withAlpha(222);

Color fade(Color color1, Color color2, [num weight = 0.5]) {
    int r1 = color1.red;
    int g1 = color1.green;
    int b1 = color1.blue;

    int r2 = color2.red;
    int g2 = color2.green;
    int b2 = color2.blue;

    return Color.fromARGB(
      255,
      r1 + ((r2 - r1) * weight).toInt(),
      g1 + ((g2 - g1) * weight).toInt(),
      b1 + ((b2 - b1) * weight).toInt()
    );
}

LinearGradient toFancyGradient(Color color) {
  final color1 = fade(color, TColors.gold, 0.6);
  final color2 = fade(color, TColors.purple, 0.3);

  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [color1, color2]
  );
}

class TFonts {
  static const String mainFont = "InterUI";
  static const String logoFont = "leaguespartan";

  static const TextStyle styleLogo = const TextStyle(
      color: TColors.primaryColor,
      fontWeight: medium,
      fontSize: 40.0,
      height: 1.1,
      fontFamily: logoFont);
}

// Font weights.
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

ThemeData getTheme([ThemeData base]) {
  if (base == null) {
    base = ThemeData.light();
  }

  return base.copyWith(
    primaryColor: TColors.primaryColor,
    accentColor: TColors.accentColor,

    highlightColor: TColors.primaryColor.withAlpha(100),
    splashColor: TColors.primaryColor.withAlpha(70),

    textTheme: getTextTheme(base.textTheme),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: InputBorder.none
    )
  );
}

TextTheme getTextTheme([TextTheme base]) {
  if (base == null) {
    base = Typography(platform: defaultTargetPlatform).black;
  }

  return base
      .copyWith(
        display1: base.title.copyWith(
          fontWeight: medium,
          fontSize: 20.0
        ),
        headline: base.headline.copyWith(
          fontWeight: medium,
          fontSize: 32.0),
        title: base.title.copyWith(
          fontWeight: regular,
          fontSize: 24.0),
        body2: base.body2.copyWith(
          fontWeight: medium,
          color: alpha45(base.body2.color),
          fontSize: 12.0),
      )
      .apply(fontFamily: TFonts.mainFont);
}