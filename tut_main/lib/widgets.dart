library tut.widgets;

import "dart:async";
import "dart:math" as math;
import "dart:io" show HttpClient;
import "dart:typed_data";
import "dart:ui" as ui;

import "package:flutter/foundation.dart" show defaultTargetPlatform, consolidateHttpClientResponseBytes, SynchronousFuture;
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

import "package:quiver/collection.dart";
import "package:meta/meta.dart";

import "package:dartkit/dartkit.dart" show Tuple;
import "package:dartkit/intl.dart";
import "package:dartkit/cache.dart";

import "package:tut_spec/tut_spec.dart";

// header-related widgets
part "src/widgets/status_bar.dart";
part "src/widgets/header.dart";

// text field
part "src/widgets/brand_text_field.dart";

// basic card
part "src/widgets/basic_card.dart";
part "src/widgets/basic_card_background.dart";

// card/item related widgets
part "src/widgets/mini_pill.dart";
part "src/widgets/avatar.dart";

part "src/widgets/inset_foreground_fade.dart";
part "src/widgets/tactile_dismissable.dart";

// images
part "src/widgets/image_cache_provider.dart";
part "src/widgets/image_cache_network_image.dart";

// misc widgets
part "src/widgets/faux_material.dart";
part "src/widgets/infinite_row_builder.dart";
part "src/widgets/padded_text.dart";
part "src/widgets/expanded_align.dart";

class Brand {
  static const String title = "tut.";

  static ThemeData lightTheme = buildTheme();
  static ThemeData darkTheme = buildTheme(ThemeData.dark());

  static ThemeData buildTheme([ThemeData base, TextTheme textBase]) {
    if (base == null) {
      base = ThemeData.light();
    }

    if (textBase == null) {
      textBase = base.textTheme;
    }

    return base.copyWith(
      primaryColor: BrandColors.main,
      accentColor: BrandColors.golden,  

      highlightColor: BrandColors.main.withAlpha(100),
      splashColor: BrandColors.main.withAlpha(70),
      
      textTheme: BrandTypography.buildTextTheme(textBase),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none
      )
    );
  }
}

class BrandColors {
  static const Color main = const Color.fromRGBO(58, 181, 229, 1.0);

  static const Color purple = const Color.fromRGBO(66, 0, 57, 1.0);

  static const Color golden = const Color.fromRGBO(232, 197, 71, 1.0);
  static const Color red = const Color.fromRGBO(206, 45, 79, 1.0);

  static const Color bgGray = const Color.fromRGBO(255, 247, 248, 1.0);
}

class BrandTypography {
  static const String mainFont = "Rubik";
  static const String logoFont = "leaguespartan";

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;

  static const TextStyle styleLogo = const TextStyle(
      color: BrandColors.main,
      fontWeight: medium,
      fontSize: 48.0,
      height: 1.1,
      fontFamily: logoFont);

  static TextTheme buildTextTheme([TextTheme base]) {
    if (base == null) {
      base = Typography(platform: defaultTargetPlatform).black;
    }

    return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: medium,
          fontSize: 24.0),
        title: base.title.copyWith(
          fontWeight: regular,
          fontSize: 24.0),
        body2: base.body2.copyWith(
          fontWeight: medium,
          color: alpha45(base.body2.color),
          fontSize: 12.0),
      )
      .apply(fontFamily: BrandTypography.mainFont);
  }
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