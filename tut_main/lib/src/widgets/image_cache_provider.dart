part of tut.widgets;

class ImageCacheProvider extends InheritedWidget {
  static ImageCacheProvider of(BuildContext context) =>
      context.ancestorWidgetOfExactType(ImageCacheProvider);

  final Cache<String, Uint8List> cache;

  ImageCacheProvider({@required this.cache, @required Widget child, Key key}):
      super(key: key, child: child);

  @override
  bool updateShouldNotify(ImageCacheProvider oldWidget) => cache != oldWidget.cache;

  ImageCacheNetworkImage image(Uri uri) => ImageCacheNetworkImage(uri: uri, cache: cache);
}
