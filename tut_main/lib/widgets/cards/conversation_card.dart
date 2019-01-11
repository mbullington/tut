part of tut.widgets;

class ConversationCard extends StatelessWidget {
  final Conversation conversation;

  final bool first;
  final bool last;

  ConversationCard({Key key, @required this.conversation, @required this.first, @required this.last}) : super(key: key);

  void _onTap() {

  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final tutor = conversation.users.last;

    final body1 = textTheme.body1.copyWith(color: alpha54(textTheme.body1.color));

    BorderRadius radius;
    const radiusValue = const Radius.circular(8.0);

    if (first) {
      radius = BorderRadius.only(topLeft: radiusValue, topRight: radiusValue);
    } else if (last) {
      radius = BorderRadius.only(bottomLeft: radiusValue, bottomRight: radiusValue);
    }

    return new Material(
      color: Colors.white,
      type: MaterialType.canvas,
      elevation: 2.0,
      borderRadius: radius,
      child: ListTile(
        leading: Avatar(
          fallbackColor: Colors.black12,
          user: tutor
        ),
        title: Text(tutor.name, style: body1),
        subtitle: Text(conversation.messages.last.rawText,
          style: textTheme.subhead,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: DateMiniPill(conversation.messages.last.timestamp),
        onTap: _onTap
      )
    );
  }
}
