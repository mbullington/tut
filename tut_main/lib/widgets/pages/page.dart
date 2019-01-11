part of tut.widgets;

abstract class Page extends StatefulWidget {  
  IconData get icon;
  String get title;

  Page({Key key}): super(key: key);

/**
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
  */
}