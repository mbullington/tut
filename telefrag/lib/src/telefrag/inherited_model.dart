part of telefrag;

/// Provides [model] to its [child] [Widget] tree via [InheritedWidget].  When
/// [version] changes, all descendants who request (via
/// [BuildContext.inheritFromWidgetOfExactType]) to be rebuilt when the model
/// changes will do so.
class InheritedModel<T extends Model> extends InheritedWidget {
  final T model;
  final int version;
  InheritedModel({Key key, Widget child, this.model})
      : this.version = model._version,
        super(key: key, child: child);

  /// Used to return the runtime type.
  const InheritedModel.forRuntimeType()
      : this.model = null,
        this.version = 0;

  @override
  bool updateShouldNotify(InheritedModel<T> oldWidget) =>
      (oldWidget.version != version);
}