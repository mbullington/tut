part of telefrag;

/// Base class for classes that provide data via [InheritedWidget]s.
abstract class Model extends Listenable {
  /// Returns the [Model] of type [T] of the closest ancestor [ScopedModel].
  ///
  /// [Widget]s who call [of] with a [rebuildOnChange] of true will be rebuilt
  /// whenever there's a change to the returned model.
  static T of<T extends Model>(BuildContext context, {bool rebuildOnChange: false}) {
    // ignore: prefer_const_constructors
    final Type type = InheritedModel<T>.forRuntimeType().runtimeType;
    Widget widget = rebuildOnChange
        ? context.inheritFromWidgetOfExactType(type)
        : context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return (widget is InheritedModel<T>) ? widget.model : null;
  }

  final Set<VoidCallback> _listeners = Set<VoidCallback>();

  int _version = 0;

  Debounce _callListeners;

  Model() {
    _callListeners = Debounce.microtask(() {
      _version++;
      for (VoidCallback listener in _listeners) {
        listener();
      }
    });
  }
  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  /// Returns the number of listeners listening to this model.
  int get listenerCount => _listeners.length;

  /// Should be called only by [Model] when the model has changed.
  void notifyListeners() {
    // schedule for next microtask
    _callListeners();
  }
}