part of tut.pages;

// hacky stuff used by various things
// should **not** be changed by PageDefinition subclasses
class _PageDefinitionInternal {
  PageDefinitionRanking ranking = PageDefinitionRanking.hidden;
}

class PageDefinitionRanking {
  static const PageDefinitionRanking current = PageDefinitionRanking._(3);
  static const PageDefinitionRanking lastCurrent = PageDefinitionRanking._(2);
  static const PageDefinitionRanking hidden = PageDefinitionRanking._(1);

  final int _ranking;

  const PageDefinitionRanking._(this._ranking);

  bool operator<(PageDefinitionRanking b) {
    return this._ranking < b._ranking;
  }

  bool operator>(PageDefinitionRanking b) {
    return this._ranking > b._ranking;
  }

  int compareTo(PageDefinitionRanking b) {
    return _ranking.compareTo(b._ranking);
  }
}

abstract class PageDefinition {  
  ValueKey get key;

  final _PageDefinitionInternal internal = _PageDefinitionInternal();

  final IconData icon;
  final String title;

  AnimationController controller;
  CurvedAnimation _curve;

  PageDefinition({
      @required TickerProvider vsync,
      @required this.icon,
      @required this.title}) {
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: vsync);
    _curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
  }

  Widget build(BuildContext context);

  final Tween<Offset> _tweenSwipeIn = Tween<Offset>(
    begin: const Offset(1.05, 0.0),
    end: Offset.zero,
  );

  final Tween<Offset> _tweenSwipeOut = Tween<Offset>(
    begin: const Offset(-1.05, 0.0),
    end: Offset.zero,
  );

  Widget transition(BuildContext context, PageDefinitionRanking ranking, int direction) {
    Widget widget = Material(
      type: MaterialType.canvas,
      color: BrandColors.bgGray,
      elevation: 6.0,
      child: build(context)
    );

    if (ranking == PageDefinitionRanking.hidden) {
      return new Offstage(child: widget);
    }
    
    return new SlideTransition(
        position: (
          (ranking == PageDefinitionRanking.current && direction > 0) ||
              (ranking == PageDefinitionRanking.lastCurrent && direction < 0) ?
                  _tweenSwipeIn : _tweenSwipeOut
        ).animate(_curve),
        child: ScaleTransition(
          alignment: Alignment.bottomCenter,
          scale: Tween<double>(
              begin: 0.8,
              end: 1.0)
            .animate(_curve),
          child: widget
        )
      );
  }
}