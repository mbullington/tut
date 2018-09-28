part of tut.widgets;

// text field that has correct styling for our brand
// might also have a few tricks up its sleeve (w.i.p.)
class BrandTextField extends StatelessWidget {
  final TextEditingController controller;

  final InputDecoration decoration;

  BrandTextField({Key key, this.controller, this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.canvas,
      borderRadius: BorderRadius.circular(6.0),
      elevation: 2.0,
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: BrandColors.golden),
        child: TextField(
          controller: controller,
          decoration: decoration.copyWith(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                child: decoration.prefixIcon))
        )
      )
    );
  }
}