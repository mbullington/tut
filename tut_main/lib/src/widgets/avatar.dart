part of tut.widgets;

class Avatar extends StatelessWidget {
  static const double defaultRadius = 24.0;

  final User user;
  
  final double radius;

  final Color fallbackColor;

  ImageCacheNetworkImage _image;

  Avatar({Key key, this.radius: defaultRadius, @required this.user, @required this.fallbackColor}) : super(key: key);

  Widget buildAvatar(BuildContext context) {
    final uri = this.user.avatarUri;
    BoxDecoration decoration;

    if (uri == null) {
      decoration = BoxDecoration(
          color: fallbackColor,
          shape: BoxShape.circle
      );
    } else {
      if (_image == null || _image.uri != uri) {
        final imageCache = ImageCacheProvider.of(context);
        _image = imageCache.image(uri);
      }

      decoration = BoxDecoration(
          color: fallbackColor,
          image: DecorationImage(image: _image, fit: BoxFit.cover),
          shape: BoxShape.circle
      );
    }

    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: DecoratedBox(decoration: decoration)
    );
  }

  @override
  Widget build(BuildContext context) => buildAvatar(context);
}

class AvatarWithName extends Avatar {
  static const EdgeInsets hintPadding = const EdgeInsets.only(top: 8.0, left: 12.0, right: 12.0);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      buildAvatar(context),
      PaddedText(user.name,
          style: Theme.of(context).textTheme.body2,
          padding: hintPadding
      ),
    ]);
  }
}
