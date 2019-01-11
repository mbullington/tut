part of tut.widgets;

class MessagesPage extends Page {
  final IconData icon = OMIcons.sms;
  final String title = "Messages";

  MessagesPage({Key key}) : super(key: key);

  @override
  _MessagesPage createState() => _MessagesPage();
}

class _MessagesPage extends State<MessagesPage> {
  final ScrollController controller = new ScrollController();

  ConversationsModel _findModel(BuildContext context) =>
      Model.of<ConversationsModel>(context);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final model = _findModel(context);
    model.fetch();
  }

  Widget _itemBuilder(BuildContext context, Conversation conversation, int i, bool first, bool last) {
    final key = conversation.hashCode.toString();
    return ConversationCard(key: Key(key), conversation: conversation, first: first, last: last);
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
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 28.0),
            widgets: <Widget>[
              Subtitle("Messages"),
            ],
          ),
          SliverGlueList<Conversation>(
            data: model.data,
            builder: _itemBuilder,
            padding: const EdgeInsets.all(16.0),
          )
        ],
      )
    );
  }
}
