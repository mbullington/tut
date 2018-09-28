part of tut.models;

abstract class DataModel<T> extends Model {
  List<T> get data;

  Future<Null> fetch();

  Future<Null> refresh();
}