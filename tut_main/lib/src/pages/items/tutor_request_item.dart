part of tut.pages;

class TutorRequestItem extends StatelessWidget {
  final TutorRequest tutorRequest;

  final TextTheme textTheme = Brand.darkTheme.textTheme;
  final Color buttonBackground = Colors.white.withAlpha(52);

  TutorRequestItem({Key key, @required this.tutorRequest}) : super(key: key);

  void _onPressed() {

  }

  Widget _buildTopRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Avatar(
            fallbackColor: Colors.white,
            user: tutorRequest.user
        ),
        ExpandedAlign(
            alignment: Alignment.centerRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                PaddedText(tutorRequest.className.toUpperCase(),
                    padding: const EdgeInsets.only(bottom: 4.0, right: 4.0),
                    style: textTheme.body2.copyWith(color: alpha87(textTheme.body2.color))),
                DateMiniPill(tutorRequest.dueDate),
              ],
            )
        )
      ],
    );
  }

  Widget _buildBottomRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Material(
            type: MaterialType.circle,
            color: buttonBackground,
            child: IconButton(
                color: BrandColors.bgGray,
                icon: Icon(Icons.close),
                onPressed: _onPressed
            )
        ),
        ExpandedAlign(
            alignment: Alignment.bottomRight,
            child: Material(
                type: MaterialType.circle,
                color: buttonBackground,
                child: IconButton(
                    color: BrandColors.golden,
                    icon: Icon(Icons.check),
                    onPressed: _onPressed
                )
            )
        )
      ],
    );
  }

  Widget _buildInnerCard(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTopRow(context),
          PaddedText(tutorRequest.assignment,
            padding: const EdgeInsets.only(top: 12.0),
            style: textTheme.title,
            maxLines: 3,
          ),
          ExpandedAlign(
            alignment: Alignment.bottomLeft,
            child: _buildBottomRow(context),
          )
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasicCard(
        onPressed: _onPressed,
        child: _buildInnerCard(context)
    );
  }
}