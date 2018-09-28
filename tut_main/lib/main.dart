import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/rendering.dart";

import "package:intl/intl.dart";

import "package:dartkit/cache.dart";
import "package:telefrag/telefrag.dart";

import "external.dart";
import "models.dart";
import "widgets.dart";
import "pages.dart";

// adds scaffolding, bottom navigation bar
// and allows for child views to be mutated
class HomeWrapper extends StatefulWidget {
  final List<PageDefinition> navEntries;

  HomeWrapper({@required this.navEntries});

  @override
  _HomeWrapperState createState() => new _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int lastCurrentIndex = 0;
  int currentIndex = 0;

  List<PageDefinition> sortedDefinitions = [];

  int _compareDefinitions(PageDefinition a, PageDefinition b) {
    return a.internal.ranking.compareTo(b.internal.ranking);
  }

  void _initRankings() {
    final PageDefinition currentDef = widget.navEntries[currentIndex];

    widget.navEntries.forEach((def) {
      def.internal.ranking = (def == currentDef) ? PageDefinitionRanking.current : PageDefinitionRanking.hidden;
    });
  }

  void _sortDefinitions() {
    sortedDefinitions.clear();
    sortedDefinitions.addAll(widget.navEntries);

    sortedDefinitions.sort((PageDefinition a, PageDefinition b) => _compareDefinitions(a, b));
  }

  @override
  Widget build(BuildContext context) {
    if (sortedDefinitions.isEmpty) {
      _initRankings();
      _sortDefinitions();
      widget.navEntries[currentIndex].controller.value = 1.0;
    }

    final List<Widget> children = sortedDefinitions
        .map((def) => def.transition(context, def.internal.ranking, currentIndex - lastCurrentIndex))
        .toList();

    return new Scaffold(
      body: DecoratedBox(decoration: const BoxDecoration(color: BrandColors.golden), child: Stack(children: children)),
      bottomNavigationBar: BrandBottomNavBar(
        iconSize: 28.0,
        items: widget.navEntries
            .map((def) => BottomNavigationBarItem(icon: Icon(def.icon), title: Text(def.title)))
            .toList(),
        currentIndex: currentIndex,
        onTap: (newIndex) => setState(() {
          if (newIndex == currentIndex) {
            return;
          }

          lastCurrentIndex = currentIndex;
          currentIndex = newIndex;

          _sortDefinitions();

          final PageDefinition oldLastCurrentDef =
              lastCurrentIndex > -1 ? widget.navEntries[lastCurrentIndex] : null;

          oldLastCurrentDef ?? (oldLastCurrentDef.internal.ranking = PageDefinitionRanking.hidden);

          final PageDefinition currentDef = widget.navEntries[currentIndex];
          final PageDefinition lastCurrentDef = widget.navEntries[lastCurrentIndex];

          currentDef.internal.ranking = PageDefinitionRanking.current;
          lastCurrentDef.internal.ranking = PageDefinitionRanking.lastCurrent;

          currentDef.controller.forward();
          lastCurrentDef.controller.reverse().then((_) => setState(() {
            lastCurrentDef.internal.ranking = PageDefinitionRanking.hidden;
          }));
        })
      )
    );
  }
}

// adds scaffolding, bottom navigation bar
// and allows for child views to be mutated
class MyApp extends StatefulWidget {
  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  static final SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
    systemNavigationBarColor: BrandColors.main,
    systemNavigationBarDividerColor: null,
    statusBarColor: null,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness:  Brightness.dark);

  static final MyTutorRequestsModel _myTutorRequestModel = MockMyTutorRequestsModel();
  static final TutorRequestsModel _tutorRequestModel = MockTutorRequestsModel();
  static final ConversationsModel _conversationsModel = MockConversationsModel();

  static final Cache<String, Uint8List> _imageCache = InMemoryCache.lru(100);

  List<PageDefinition> navEntries;

  @override
  void initState() {
    super.initState();
    navEntries = [
      AskHelpPageDefinition(vsync: this),
      TutorPageDefinition(vsync: this),
      MessagesPageDefinition(vsync: this),
    ];

    // TODO: this is obviously wrong
    Intl.defaultLocale = "en_US";
  }

  Widget _buildProviders(BuildContext context, Widget child) {
    return (
        Provider(
            model: _myTutorRequestModel,
            child: Provider(
                model: _tutorRequestModel,
                child: Provider(
                  model: _conversationsModel,
                  child: ImageCacheProvider(cache: _imageCache, child: child)
                )
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);

    return MaterialApp(
      title: Brand.title,
      theme: Brand.lightTheme,
      home: _buildProviders(
          context,
          HomeWrapper(navEntries: navEntries)
      )
    );
  }
}

void main() => runApp(MyApp());
