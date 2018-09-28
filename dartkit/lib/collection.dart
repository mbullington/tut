library dartkit.collection;

List<E> conditionalListBuilder<E>(List list) {
  List<E> returnedList = <E>[];

  int i = 0;

  if (list.length % 2 == 1) {
    assert(list.first is List<E>);

    returnedList..addAll(list.first);
    i++;
  }

  final int l = list.length;
  for (; i < l; i += 2) {
    final condition = list[i];
    final value = list[i + 1];

    assert(condition is bool);
    assert(value is List<E>);

    if (condition) {
      returnedList..addAll(value);
    }
  }

  return returnedList;
}