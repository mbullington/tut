part of tut.models;

class MockTutorRequestsModel extends TutorRequestsModel {
  static final List<TutorRequest> _mock = List.generate(
      Mock.rand.nextInt(8) + 4,
          (i) => Mock.tutorRequest()
  );

  List<TutorRequest> get data => _mock;

  Future<Null> fetch() => new Future.value(null);

  Future<Null> refresh() => new Future.delayed(Duration(seconds: Mock.rand.nextInt(4)));
}
