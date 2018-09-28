part of telefrag;

/// Builds a child for a [ModelProviderDescendant].
typedef Widget ProviderBuilder<T extends Model>(
    BuildContext context,
    Widget child,
    T model,
    );

/// A [Widget] who rebuilds its child by calling [builder] whenever the [Model]
/// provided by an ancestor [ModelProvider] changes.
class Consumer<T extends Model> extends StatelessWidget {
  final ProviderBuilder<T> builder;

  /// An optional constant child that does not depend on the model.  This will
  /// be passed as the child of [builder].
  final Widget child;

  const Consumer({@required this.builder, @required this.child});

  @override
  Widget build(BuildContext context) => builder(
    context,
    child,
    Model.of<T>(context, rebuildOnChange: true)
  );
}