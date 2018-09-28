part of tut.widgets;

class BasicCard extends StatefulWidget {
  static const BorderRadius radius = BorderRadius.all(const Radius.circular(8.0));

  final VoidCallback onPressed;
  final Widget child;

  final Color color;
  final Color shadowColor;

  BasicCard({
      Key key,
      @required this.child,
      @required this.onPressed,
      this.color: BrandColors.purple,
      this.shadowColor: BrandColors.red
    }): super(key: key);

  @override
  _BasicCard createState() => _BasicCard();
}

class _BasicCard extends State<BasicCard> {
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Brand.darkTheme,
        child: Listener(
            onPointerDown: (_) => setState(() => (this._enabled = true)),
            onPointerUp: (_) => setState(() => (this._enabled = false)),
            child: Material(
              color: widget.color,
              shadowColor: widget.shadowColor,
              elevation: _enabled ? 8.0 : 1.0,
              borderRadius: BasicCard.radius,
              child: InkWell(
                  onTap: widget.onPressed,
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
