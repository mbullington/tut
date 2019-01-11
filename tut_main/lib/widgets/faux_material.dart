part of tut.widgets;

// essentially a cheap, worse version of the Material widget that only
// renders box-shadows (copied from Material Design Lite)
// a brainchild of the millisecond optimizations that keep me awake at night.
class FauxMaterial extends StatelessWidget {
  static const List<BoxShadow> _boxShadows = const <BoxShadow>[
    const BoxShadow(
      offset: const Offset(0.0, 15.0),
      blurRadius: 35.0,
      color: const Color.fromRGBO(0, 0, 0, 0.03)
    ),
    const BoxShadow(
      offset: const Offset(0.0, 5.0),
      blurRadius: 15.0,
      color: const Color.fromRGBO(0, 0, 0, 0.06)
    )
  ];

  final Widget child;
  final Color color;

  FauxMaterial({Key key, @required this.child, this.color: Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: _boxShadows, color: color),
      child: child
    );
  }
}