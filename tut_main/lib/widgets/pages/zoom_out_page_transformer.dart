part of tut.widgets;

// based off of transformer_page_view
// https://github.com/best-flutter/transformer_page_view
class ZoomOutPageTransformer extends PageTransformer {
  static const double MIN_SCALE = 0.94;
  static const double MIN_ALPHA = 0.9;

  @override
  Widget transform(Widget child, TransformInfo info) {
    double position = info.position;
    double pageWidth = info.width;
    double pageHeight = info.height;

    if (position < -1) {
      // This page is way off-screen to the left.
    } else if (position <= 1) {
      // Modify the default slide transition to
      // shrink the page as well
      double scaleFactor = math.max(MIN_SCALE, 1 - position.abs());
      double vertMargin = pageHeight * (1 - scaleFactor) / 2;
      double horzMargin = pageWidth * (1 - scaleFactor) / 2;
      double dx;
      if (position < 0) {
        dx = (horzMargin - vertMargin / 2);
      } else {
        dx = (-horzMargin + vertMargin / 2);
      }
      // Scale the page down (between MIN_SCALE and 1)
      double opacity = MIN_ALPHA + (scaleFactor - MIN_SCALE) / (1 - MIN_SCALE) * (1 - MIN_ALPHA);

      return Opacity(
        opacity: opacity,
        child: Transform.translate(
          offset: Offset(dx, 0.0),
          child: Transform.scale(
            scale: scaleFactor,
            child: child,
            alignment: Alignment.bottomCenter,
          ),
        ),
      );
    } else {
      // This page is way off-screen to the right.
    }

    return child;
  }
}

