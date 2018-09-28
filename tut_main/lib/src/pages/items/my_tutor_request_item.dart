part of tut.pages;

class MyTutorRequestItem extends StatelessWidget {
  final TutorRequest tutorRequest;

  final TextTheme textTheme = Brand.darkTheme.textTheme;

  MyTutorRequestItem({Key key, @required this.tutorRequest}) : super(key: key);

  void _onPressed() {

  }

  Widget _buildTopRow(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Text(
              tutorRequest.className.toUpperCase(),
              style: textTheme.body2.copyWith(
                  color: alpha54(textTheme.body2.color)))),
          DateMiniPill(tutorRequest.dueDate)
        ]
    );
  }

  Widget _buildAvatar(BuildContext context, int index) {
    return Opacity(
        opacity: 1.0 - 0.15 * index,
        child: Avatar(
            fallbackColor: Colors.white,
            user: tutorRequest.acceptedTutors[index]
        )
    );
  }

  Widget _buildBottomRow(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        InsetForegroundFade(
          color: BrandColors.purple,
          orientation: Orientation.landscape,
          insets: Tuple(0.0, 32.0),
          blur: Tuple(0.0, 16.0),
          child: InfiniteRowBuilder(
              builder: _buildAvatar,
              itemSpacing: 8.0,
              itemWidth: Avatar.defaultRadius * 2,
              limit: tutorRequest.acceptedTutors.length.toDouble()
          ),
        ),
        Material(
            type: MaterialType.circle,
            color: Colors.transparent,
            child: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: _onPressed
            )
        )
      ],
    );
  }

  Widget _buildInnerCard(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: conditionalListBuilder<Widget>([
          <Widget>[
            _buildTopRow(context),
            PaddedText(tutorRequest.assignment,
              padding: const EdgeInsets.only(top: 8.0),
              style: textTheme.title,
              maxLines: 3,
            ),
            ExpandedAlign(
              alignment: Alignment.bottomLeft,
              child: PaddedText(
                  "Available tutors (${tutorRequest.acceptedTutors.length})",
                  padding: const EdgeInsets.only(bottom: 8.0),
                  style: textTheme.body2
              ),
            )
          ],
          tutorRequest.acceptedTutors.isNotEmpty,
          <Widget>[_buildBottomRow(context)],
        ])
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