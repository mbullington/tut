part of tut.models;

class MockMyTutorRequestsModel extends MyTutorRequestsModel {
  static final User _me = Mock.user();

  static final List<TutorRequest> _mock = List.generate(
      Mock.rand.nextInt(5) + 2,
      (i) => Mock.tutorRequest(_me)
  );

  List<TutorRequest> get data => _mock;

  Future<Null> fetch() => new Future.value(null);

  Future<Null> refresh() => new Future.delayed(Duration(seconds: Mock.rand.nextInt(4)));
}
