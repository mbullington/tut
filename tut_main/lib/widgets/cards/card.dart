part of tut.widgets;

class Card extends StatefulWidget {
  static const BorderRadius borderRadius = BorderRadius.all(const Radius.circular(8.0));

  final VoidCallback onPressed;
  final Widget child;

  final Color color;
  final Color shadowColor;

  Card({
      Key key,
      @required this.child,
      @required this.onPressed,
      this.color: TColors.purple,
      this.shadowColor: TColors.red
    }): super(key: key);

  @override
  _Card createState() => _Card();
}

class _Card extends State<Card> {
  static final _darkTheme = getTheme(ThemeData.dark());

  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: _darkTheme,
        child: Listener(
            onPointerDown: (_) => setState(() => (this._enabled = true)),
            onPointerUp: (_) => setState(() => (this._enabled = false)),
            child: Material(
              color: widget.color,
              shadowColor: widget.shadowColor,
              elevation: _enabled ? 8.0 : 1.0,
              borderRadius: Card.borderRadius,
              child: InkWell(
                  onTap: widget.onPressed,
                  borderRadius: Card.borderRadius,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: widget.child
                  )
              ),
            )
        )
    );
  }
}
