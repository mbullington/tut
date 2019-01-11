part of tut.widgets;

class TactileDismissable extends StatefulWidget {
  final Widget child;
  final Widget background;

  // threshold for what deems an event in pixels
  final double threshold;

  final VoidCallback leftCallback;
  final VoidCallback rightCallback;

  TactileDismissable({Key key, @required this.child, this.background, this.threshold: 50.0, this.leftCallback, this.rightCallback})
      : super(key: key);

  @override
  _TactileDismissable createState() => _TactileDismissable();
}

class _TactileDismissable extends State<TactileDismissable> with TickerProviderStateMixin {
  static const double deltaFactorX = 0.5;
  static const double deltaFactorY = 0.2;

  static const double maxAngle = math.pi / 6;

  double _x = 0.0;
  Matrix4 transform = Matrix4.identity();

  AnimationController controller;
  CurvedAnimation _curve;
  Animation<num> _transformAnimation;

  _TactileDismissable() {
    controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
  }

  void _dragStart(DragStartDetails details) {
    if (controller.isAnimating) {
      controller.stop();
    }
  }

  void _transformUpdate(double delta) {
    setState(() {
      final dx = delta * deltaFactorX;

      final x = _x;
      _x += dx;

      // this is kinda hacky, but it really helps keep things aligned
      if ((x > 0 && _x < 0) || (x < 0 && _x > 0)) {
        _x = 0.0;

        transform.translate(dx);
        transform.setTranslationRaw(_x, 0.0, 0.0);
      } else {
        double dy = delta * deltaFactorY;
        if (_x > 0) {
          dy *= -1;
        }

        transform.translate(dx, dy);
      }

      // really just random values in honesty, whatever feels right
      double dr = maxAngle * delta * deltaFactorX / 360;

      transform.rotateZ(dr);
    });
  }

  void _dragUpdate(DragUpdateDetails details) => _transformUpdate(details.primaryDelta);

  void _dragEnd(DragEndDetails details) {
    _transformAnimation = Tween<double>(begin: _x, end: 0.0).animate(_curve);

    double lastValue = _x;

    void listener() {
      final value = _transformAnimation.value;

      _transformUpdate((value - lastValue) / deltaFactorX);

      lastValue = value;
    }

    void statusListener(AnimationStatus status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        _transformAnimation.removeListener(listener);
        _transformAnimation.removeStatusListener(statusListener);
        _transformAnimation = null;

        controller.reset();

        setState(() {
          _x = 0.0;
          transform = Matrix4.identity();
        });
      }
    }

    _transformAnimation.addListener(listener);
    _transformAnimation.addStatusListener(statusListener);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Transform(
        alignment: Alignment.center,
        transform: transform,
        child: widget.child
    );

    if (widget.background != null) {
      child = Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          widget.background,
          child
        ],
      );
    }

    return GestureDetector(
        onHorizontalDragStart: _dragStart,
        onHorizontalDragUpdate: _dragUpdate,
        onHorizontalDragEnd: _dragEnd,
        child: child
    );
  }
}
