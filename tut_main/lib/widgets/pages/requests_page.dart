part of tut.widgets;

class RequestsPage extends Page {
  final IconData icon = OMIcons.book;
  final String title = "Requests";

  RequestsPage({Key key}) : super(key: key);

  @override
  _RequestsPage createState() => _RequestsPage();
}

class _RequestsPage extends State<RequestsPage> {
  final ScrollController controller = new ScrollController();

  final LinearGradient fancyGradient = toFancyGradient(TColors.red);

  TutorRequestsModel _findModel(BuildContext context) =>
      Model.of<TutorRequestsModel>(context);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final model = _findModel(context);
    model.fetch();
  }

  Widget _itemBuilder(BuildContext context, TutorRequest tutorRequest, int i, bool first, bool last) {
    final key = tutorRequest.id.toString();
    return TutorRequestItem(key: Key(key), tutorRequest: tutorRequest);
  }

  Widget _backgroundBuilder(BuildContext context, TutorRequest tutorRequest, int i, bool first, bool last) {
    final key = "${tutorRequest.id}_background";
    return CardBackground(key: Key(key));
  }

  @override
  Widget build(BuildContext context) {
    final model = _findModel(context);

    return FauxMaterial(
      child: RefreshScrollView(
        controller: controller,
        onRefresh: () => model.refresh(),
        slivers: <Widget>[
          Header(controller: controller),
          SliverGlueFixedList(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 28.0) + EdgeInsets.only(top: 16.0),
            widgets: <Widget>[
              Subtitle("I can\nhelp with…"),
            ],
          ),
          SliverGlueGrid<TutorRequest>(
            data: model.data,
            builder: _itemBuilder
          )
        ],
      )
    );
  }
}
