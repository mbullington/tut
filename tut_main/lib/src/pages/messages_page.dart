part of tut.pages;

class MessagesPageDefinition extends PageDefinition {
  ValueKey get key => const Key("messages_page");

  MessagesPageDefinition({TickerProvider vsync})
      : super(vsync: vsync, icon: Icons.inbox, title: "messages");

  Widget build(BuildContext context) {
    return MessagesPage(key: key);
  }
}

class MessagesPage extends StatefulWidget {
  MessagesPage({Key key}) : super(key: key);

  @override
  _MessagesPage createState() => _MessagesPage();
}

class _MessagesPage extends State<MessagesPage> {
  ConversationsModel _findModel(BuildContext context,
      {bool rebuildOnChange = false}) =>
      Model.of<ConversationsModel>(context);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final model = _findModel(context);
    model.fetch();
  }

  Widget _itemBuilder(BuildContext context, Conversation conversation) {
    return ConversationItem(
        key: Key(conversation.id.toString()), conversation: conversation);
  }

  @override
  Widget build(BuildContext context) {
    final model = _findModel(context, rebuildOnChange: true);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Header(),
        Flexible(
            child: ScrollViewGlue<Conversation>(
              onRefresh: () => model.refresh(),
              data: model.data,
              headers: <Widget>[
                Center(child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Subtitle("messages")
                ))
              ],
              builder: _itemBuilder,
              dismissable: ScrollViewGlueDismissable.none,
            )
        )
      ],
    );
  }
}
