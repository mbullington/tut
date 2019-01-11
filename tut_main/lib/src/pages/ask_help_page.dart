part of tut.pages;

class AskHelpPage extends Page {
  final IconData icon = OMIcons.book;
  final String title = "ask for help";

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

  Widget _itemBuilder(BuildContext context, TutorRequest tutorRequest, int i, bool first, bool last) {
    final key = tutorRequest.id.toString();
    return MyTutorRequestItem(key: Key(key), tutorRequest: tutorRequest);
  }

  Widget _backgroundBuilder(BuildContext context, TutorRequest tutorRequest, int i, bool first, bool last) {
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
          child: BrandScrollView(
            onRefresh: () => model.refresh(),
            slivers: <Widget>[
              ScrollGlueWidgetList(
                widgets: <Widget>[
                  Align(alignment: Alignment.centerLeft, child: Subtitle("I need help with . . .")),
                ],
              ),
              ScrollGlueGrid(
                data: model.data,
                builder: _itemBuilder,
                backgroundBuilder: _backgroundBuilder,
                dismissable: ScrollGlueDismissable.linear,
              )
            ],
          )
        )
      ],
    );
  }
}
