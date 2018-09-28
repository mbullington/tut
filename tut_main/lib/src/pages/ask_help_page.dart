part of tut.pages;

class AskHelpPageDefinition extends PageDefinition {
  ValueKey get key => const Key("ask_help_page");

  AskHelpPageDefinition({@required TickerProvider vsync}) : super(vsync: vsync, icon: Icons.edit, title: "ask for help");

  Widget build(BuildContext context) {
    return AskHelpPage(key: key);
  }
}

class AskHelpPage extends StatefulWidget {
  AskHelpPage({Key key}) : super(key: key);

  @override
  _AskHelpPage createState() => _AskHelpPage();
}

class _AskHelpPage extends State<AskHelpPage> {
  static final Color cardBackgroundColor = alpha12(Colors.black);

  final TextEditingController _controller = TextEditingController();

  MyTutorRequestsModel _findModel(BuildContext context) =>
      Model.of<MyTutorRequestsModel>(context);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final model = _findModel(context);
    model.fetch();
  }

  Widget _itemBuilder(BuildContext context, TutorRequest tutorRequest) {
    final key = tutorRequest.id.toString();
    return MyTutorRequestItem(key: Key(key), tutorRequest: tutorRequest);
  }

  Widget _backgroundBuilder(BuildContext context, TutorRequest tutorRequest) {
    final key = "${tutorRequest.id}_background";
    return BasicCardBackground(key: Key(key), color: cardBackgroundColor);
  }

  @override
  Widget build(BuildContext context) {
    final model = _findModel(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Header(),
        Flexible(
          child: ScrollViewGlue<TutorRequest>(
            type: ScrollViewGlueType.grid,
            dismissable: ScrollViewGlueDismissable.none,
            onRefresh: () => model.refresh(),
            data: model.data,
            headers: <Widget>[
              Center(child: Subtitle("I need help with . . .")),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0) + const EdgeInsets.only(bottom: 20.0),
                child: BrandTextField(
                  controller: _controller,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.add), labelText: "Assignment")
                )
              ),
            ],
            builder: _itemBuilder,
            backgroundBuilder: _backgroundBuilder,
          )
        )
      ],
    );
  }
}
