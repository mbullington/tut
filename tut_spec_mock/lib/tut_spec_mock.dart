library tut_spec_mock;

import "dart:math" as Math;

import "package:built_collection/built_collection.dart";

import "package:tut_spec/tut_spec.dart";

const _mockNames = <String>[
  // biblical names
  "Matthew",
  "Mark",
  "Luke",
  "John",
  "Michael",
  // most popular baby names 2018
  "Liam",
  "Noah",
  "Emma",
  "Olivia",
  "Oliver",
  // this is a great girls name
  "Ava",
  "Mason",
  "Sophia",
  "Logan",
  "Lucas",
  // La La Land flashbacks intensify
  "Mia"
];

const _mockImages = [
  // public domain stock images of people
  "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://images.pexels.com/photos/462680/pexels-photo-462680.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://images.pexels.com/photos/712521/pexels-photo-712521.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
  "https://images.pexels.com/photos/213117/pexels-photo-213117.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"
];

const _mockAssignments = [
  "Homework",
  "Exam #1",
  "Mid-term",
  "Final",
  "Help!",
  "I'm too far gone",
  "This effort is useless",
  "This message is really suppose to be absurdly long"
];

const _mockClasses = [
  "CMPSC 121",
  "CMPSC 360",
  "PLSC 465",
  "PHYS 211",
  "PHYS 212",
  "CALC 140",
  "CALC 141",
  "CALC 230"
];

class Mock {
  static final Math.Random rand = Math.Random();

  static T randElement<T>(List<T> list) => list[rand.nextInt(list.length)];

  static DateTime randDatePast() {
    DateTime time = DateTime.now();

    return time.subtract(Duration(days: rand.nextInt(30), minutes: rand.nextInt(100), hours: rand.nextInt(23)));
  }

  static DateTime randDateFuture() {
    DateTime time = DateTime.now();

    return time.add(Duration(days: rand.nextInt(30), minutes: rand.nextInt(100), hours: rand.nextInt(23)));
  }

  static int id() {
    return rand.nextInt(10000000);
  }

  static User user() {
    final name = randElement(_mockNames);
    final image = randElement(_mockImages);

    final verified = rand.nextBool();
    final rating = rand.nextInt(50) / 10;

    return User((b) => b
      ..id = id()
      ..name = name
      ..avatarUri = Uri.parse(image)
      ..verified = verified
      ..rating = rating
    );
  }

  static TutorRequest tutorRequest([User me]) {
    final acceptedTutors = List.generate(rand.nextInt(10), (i) => user());

    final assignment = randElement(_mockAssignments);
    final className = randElement(_mockClasses);

    final dueDate = randDateFuture();

    return TutorRequest((b) => b
      ..id = id()
      ..user = me?.toBuilder() ?? user().toBuilder()
      ..acceptedTutors = ListBuilder<User>(acceptedTutors)
      ..assignment = assignment
      ..className = className
      ..dueDate = dueDate
    );
  }

  static Message message([User user]) {
    final text = randElement(_mockAssignments);

    return Message((b) => b
      ..id = id()
      ..user = (user ?? Mock.user()).toBuilder()
      ..rawText = text
      ..timestamp = randDatePast()
    );
  }

  static Conversation conversation([User me]) {
    final _me = me ?? user();
    final them = user();

    // I am Tron; I fight for the users
    final users = [_me, them];

    final messages = List.generate(rand.nextInt(5) + 2, (i) => message(i % 2 == 0 ? _me : them));

    return Conversation((b) => b
      ..id = id()
      ..users = ListBuilder<User>(users)
      ..request = tutorRequest().toBuilder()
      ..messages = ListBuilder<Message>(messages)
    );
  }
}