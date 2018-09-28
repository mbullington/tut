part of telefrag;

/// Allows the given [model] to be accessed by [child] or any of its descendants
/// using [ModelFinder].
class Provider<T extends Model> extends StatelessWidget {
  final T model;

  final Widget child;

  const Provider({@required this.model, @required this.child});

  @override
  Widget build(BuildContext context) => new _ModelListener(
    model: model,
    builder: (BuildContext context) => new InheritedModel<T>(
      model: model,
      child: child,
    ),
  );
}

/// Listens to [model] and calls [builder] whenever [model] changes.
class _ModelListener extends StatefulWidget {
  final Model model;

  final WidgetBuilder builder;

  const _ModelListener({this.model, this.builder});

  @override
  _ModelListenerState createState() => new _ModelListenerState();
}

class _ModelListenerState extends State<_ModelListener> {
  @override
  void initState() {
    super.initState();
    widget.model.addListener(_onChange);
  }

  @override
  void didUpdateWidget(_ModelListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_onChange);
      widget.model.addListener(_onChange);
    }
  }

  @override
  void dispose() {
    widget.model.removeListener(_onChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context);

  void _onChange() => setState(() {});
}