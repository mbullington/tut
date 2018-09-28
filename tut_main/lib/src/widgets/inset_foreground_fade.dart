part of tut.widgets;

class InsetForegroundFade extends StatelessWidget {
  final Widget child;

  final Color color;
  final Orientation orientation;
  final Tuple<double, double> insets;
  final Tuple<double, double> blur;

  InsetForegroundFade({Key key,
      @required this.child,
      @required this.color,
      @required this.orientation,
      @required this.insets,
      @required this.blur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _InsetForegroundFadePainter(color: color, orientation: orientation, insets: insets, blur: blur),
      child: child,
    );
  }
}

class _InsetForegroundFadePainter extends CustomPainter {
  final Color color;
  Color _transparentColor;

  final Orientation orientation;
  final Tuple<double, double> insets;
  final Tuple<double, double> blur;

  _InsetForegroundFadePainter({
        @required this.color,
        @required this.orientation,
        @required this.insets,
        @required this.blur}) {
    _transparentColor = Color.fromRGBO(color.red, color.green, color.blue, 0.0);
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    double sizeStart = insets.one + blur.one;
    double sizeEnd = insets.two + blur.two;

    final gradientStart = LinearGradient(
      begin: orientation == Orientation.landscape ? Alignment.centerLeft : Alignment.topCenter,
      end: orientation == Orientation.landscape ? Alignment.centerRight : Alignment.bottomCenter,
      colors: <Color>[
        color,
        color,
        _transparentColor
      ],
      stops: <double>[
        0.0,
        insets.one / sizeStart,
        1.0
      ]
    );

    final rectStart = Rect.fromLTWH(
          0.0,
          0.0,
          orientation == Orientation.landscape ? sizeStart : size.width,
          orientation == Orientation.landscape ? size.height : sizeStart);

    canvas.drawRect(
      rectStart,
      Paint()..shader = gradientStart.createShader(rectStart));

    Gradient gradientEnd = LinearGradient(
      begin: orientation == Orientation.landscape ? Alignment.centerLeft : Alignment.topCenter,
      end: orientation == Orientation.landscape ? Alignment.centerRight : Alignment.bottomCenter,
      colors: <Color>[
        _transparentColor,
        color,
        color,
      ],
      stops: <double>[
        0.0,
        blur.two / sizeEnd,
        1.0
      ]
    );

    canvas.translate(
      orientation == Orientation.landscape ? (size.width - sizeEnd) : 0.0,
      orientation == Orientation.landscape ? 0.0 : (size.height - sizeEnd)
    );

    final rectEnd = Rect.fromLTWH(
          0.0,
          0.0,
          orientation == Orientation.landscape ? sizeEnd : size.width,
          orientation == Orientation.landscape ? size.height : sizeEnd);

    canvas.drawRect(
      rectEnd,
      Paint()..shader = gradientEnd.createShader(rectEnd));

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter _) => false;
}