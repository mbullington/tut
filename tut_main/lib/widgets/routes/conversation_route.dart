part of tut.widgets;

class ConversationRoute extends StatefulWidget {
  static void routeTo(BuildContext context, Conversation conversation) {
    final route = MaterialPageRoute(builder: (_) => ConversationRoute(conversation: conversation));
    Navigator.of(context).push(route);
  }

  final Conversation conversation;

  ConversationRoute({Key key, @required this.conversation}): super(key: key);

  _ConversationRouteState createState() => _ConversationRouteState();
}

class _ConversationRouteState extends State<ConversationRoute> {
  final TextEditingController textController = TextEditingController();

  Widget _buildAppBar(BuildContext context) {
    final tutor = widget.conversation?.users?.last;
    final textTheme = getTextTheme();

    return AppBar(
      elevation: 2.0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      textTheme: textTheme,
      iconTheme: IconThemeData(color: Colors.black),
      title: Row(
        children: <Widget>[
          Avatar(
            fallbackColor: Colors.black12,
            user: tutor,
            radius: 20.0
          ),
          PaddedText(
            tutor.name,
            style: textTheme.display1,
            padding: const EdgeInsets.only(left: 12.0)
          )
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildTextComposer(BuildContext context) {
    return SizedBox(
      height: 96.0,
      child: Material(
        type: MaterialType.canvas,
        color: Colors.blue,
        elevation: 6.0
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: _buildTextComposer(context)
    );
  }
}