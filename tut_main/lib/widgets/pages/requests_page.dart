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

  Widget _dismissableBuilder(BuildContext context, Widget widget, entry, VoidCallback onDismissed) {
    return TactileDismissable(
      key: ValueKey("${entry.hashCode.toString()}_dismissible"),
      child: widget,
      background: CardBackground(),
    );
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
                  Subtitle("I can\nhelp with…"),
                  GradientButton(
                    gradient: fancyGradient,
                    child: Text("Manage"),
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
            builder: _itemBuilder,
            dismissible: true,
            dismissibleBuilder: _dismissableBuilder,
            onDismissed: () => {},
          )
        ],
      )
    );
  }
}
