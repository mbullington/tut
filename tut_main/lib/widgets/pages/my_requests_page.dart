part of tut.widgets;

class MyRequestsPage extends Page {
  final IconData icon = OMIcons.book;
  final String title = "My requests";

  MyRequestsPage({Key key}) : super(key: key);

  @override
  _MyRequestsPage createState() => _MyRequestsPage();
}

class _MyRequestsPage extends State<MyRequestsPage> {
  final ScrollController controller = new ScrollController();

  final LinearGradient fancyGradient = toFancyGradient(TColors.red);

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
              Row(
                children: <Widget>[
                  Subtitle("I need\nhelp with…"),
                  CircularGradientButton(
                    gradient: fancyGradient,
                    child: Icon(Icons.add),
                    elevation: 4.0,
                    callback: () => {}
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
              )
            ],
          ),
          SliverGlueGrid<TutorRequest>(
            data: model.data,
            builder: _itemBuilder
          ),
          SliverGlueFixedList(
            padding: EdgeInsets.symmetric(vertical: 4.0) + EdgeInsets.only(top: 4.0),
            widgets: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton(
                  onPressed: () => {},
                  child: Text("SEE OTHER'S REQUESTS >")
                )
              )
            ],
          )
        ],
      )
    );
  }
}
