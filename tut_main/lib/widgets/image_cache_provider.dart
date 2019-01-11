part of tut.widgets;

class ImageCacheNetworkImage extends ImageProvider<ImageCacheNetworkImage> {
  static final Map<String, ui.Image> _images = LruMap<String, ui.Image>(maximumSize: 15);

  final Uri uri;
  final double scale;

  final Cache<String, Uint8List> cache;

  static final HttpClient _httpClient = new HttpClient();

  ImageCacheNetworkImage({@required this.uri, @required this.cache, this.scale: 1.0});

  @override
  Future<ImageCacheNetworkImage> obtainKey(ImageConfiguration config) {
    return SynchronousFuture<ImageCacheNetworkImage>(this);
  }

  @override
  ImageStreamCompleter load(ImageCacheNetworkImage key) {
    final url = uri.toString();
    final FutureOr<ui.Image> image = _images[url] ?? _getBytes().then((bytes) async {
      final codec = await ui.instantiateImageCodec(bytes);
      final frameInfo = await codec.getNextFrame();
      final image = frameInfo.image;

      _images[url] = image;
      return _images[url];
    });

    return OneFrameImageStreamCompleter(
      Future.value(image).then((image) => ImageInfo(
        image: image,
        scale: scale
      ))
    );
  }

  Future<Uint8List> _getBytes() {
    final url = uri.toString();
    return cache.get(url, (url) async {
      final req = await _httpClient.getUrl(uri);
      final res = await req.close();

      return await consolidateHttpClientResponseBytes(res);
    });
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType)
      return false;
    final ImageCacheNetworkImage typedOther = other;
    return uri == typedOther.uri
        && scale == typedOther.scale;
  }

  @override
  int get hashCode => hashValues(uri, scale);

  @override
  String toString() => '$runtimeType("$uri", scale: $scale)';
}

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
