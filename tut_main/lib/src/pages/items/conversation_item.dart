part of tut.pages;

class ConversationItem extends StatelessWidget {
  final Conversation conversation;

  ConversationItem({Key key, @required this.conversation}) : super(key: key);

  void _onTap() {

  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final User tutor = conversation.users.last;

    return new Material(
      color: Colors.white,
      type: MaterialType.canvas,
      elevation: 1.0,
      child: ListTile(
        leading: Avatar(
          fallbackColor: Colors.black12,
          user: tutor
        ),
        title: Text(tutor.name,
          style: textTheme.body1.copyWith(
              color: alpha54(textTheme.body1.color))
        ),
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
