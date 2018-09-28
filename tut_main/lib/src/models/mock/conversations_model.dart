part of tut.models;

class MockConversationsModel extends ConversationsModel {
  static final User _me = Mock.user();

  static final List<Conversation> _mock = List.generate(
      Mock.rand.nextInt(5) + 2,
      (i) => Mock.conversation(_me)
  );

  List<Conversation> get data => _mock;

  Future<Null> fetch() => new Future.value(null);

  Future<Null> refresh() => new Future.delayed(Duration(seconds: Mock.rand.nextInt(4)));
}