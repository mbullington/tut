import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/rendering.dart" show debugPaintSizeEnabled;

import "package:intl/intl.dart";

import "package:dartkit/cache.dart";
import "package:telefrag/telefrag.dart";

import "home.dart";
import "theme.dart";

import "models.dart";
import "widgets.dart";

class Provider3<A extends Model, B extends Model, C extends Model> extends StatelessWidget {
  final A modelA;
  final B modelB;
  final C modelC;

  final Widget child;

  Provider3(this.modelA, this.modelB, this.modelC, {@required this.child, Key key}): super(key: key);

  Widget build(BuildContext context) {
    return Provider(
      model: modelA,
      child: Provider(
        model: modelB,
        child: Provider(
          model: modelC,
          child: child
        )
      )
    );
  }
}

class MyApp extends StatefulWidget {
  MyApp();

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  static final MyTutorRequestsModel _myTutorRequestModel = MockMyTutorRequestsModel();
  static final TutorRequestsModel _tutorRequestModel = MockTutorRequestsModel();
  static final ConversationsModel _conversationsModel = MockConversationsModel();

  static final Cache<String, Uint8List> _imageCache = InMemoryCache.lru(100);

  @override
  void initState() {
    super.initState();

    // TODO: this is obviously wrong
    Intl.defaultLocale = "en_US";
  }

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;

    SystemChrome.setSystemUIOverlayStyle(themeOverlayStyle);

    return Provider3(
      _myTutorRequestModel,
      _tutorRequestModel,
      _conversationsModel,
      child: ImageCacheProvider(
        cache: _imageCache,
        child: MaterialApp(
          title: themeTitle,
          theme: getTheme(),
          home: Home()
        )
      ),
    );
  }
}

void main() => runApp(MyApp());
