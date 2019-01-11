part of tut.pages;

class TutorPage extends Page {
  final IconData icon = OMIcons.attachMoney;
  final String title = "tutor";

  TutorPage({Key key}) : super(key: key);

  @override
  _TutorPage createState() => new _TutorPage();
}

class _TutorPage extends State<TutorPage> {
  static final Color cardBackgroundColor = alpha12(Colors.black);

  final TextEditingController _controller = TextEditingController();

  TutorRequestsModel _findModel(BuildContext context) =>
      Model.of<TutorRequestsModel>(context);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final model = _findModel(context);
    model.fetch();
  }

  Widget _itemBuilder(BuildContext context, TutorRequest tutorRequest) {
    return TutorRequestItem(
        key: Key(tutorRequest.id.toString()), tutorRequest: tutorRequest);
  }

  Widget _backgroundBuilder(BuildContext context, TutorRequest tutorRequest) {
    final key = "${tutorRequest.id}_background";
    return BasicCardBackground(key: Key(key), color: cardBackgroundColor);
  }

  @override
  Widget build(BuildContext context) {
    final model = _findModel(context);

    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Header(),
        Flexible(
            child: ScrollViewGlue<TutorRequest>(
                type: ScrollViewGlueType.grid,
                onRefresh: () => model.refresh(),
                data: model.data,
                headers: <Widget>[
                  Center(child: Subtitle("I can help with . . .")),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 32.0) +
                          const EdgeInsets.only(bottom: 20.0),
                      child: BrandTextField(
                          controller: _controller,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.add),
                              labelText: "Class")
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
