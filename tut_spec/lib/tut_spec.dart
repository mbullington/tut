library tut_spec;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'tut_spec.g.dart';

abstract class Unique {
  int get id;
}

abstract class User implements Built<User, UserBuilder>, Unique {
  int get id;

  @BuiltValueField(compare: false)
  String get name;

  @nullable
  @BuiltValueField(compare: false)
  Uri get avatarUri;

  @BuiltValueField(compare: false)
  bool get verified;
  
  @BuiltValueField(compare: false)
  double get rating;

  User._();
  factory User([ u(UserBuilder b) ]) = _$User;
}

abstract class TutorRequest implements Built<TutorRequest, TutorRequestBuilder>, Unique {
  int get id;

  @BuiltValueField(compare: false)
  User get user;

  @BuiltValueField(compare: false)
  BuiltList<User> get acceptedTutors;

  @BuiltValueField(compare: false)
  String get assignment;
  @BuiltValueField(compare: false)
  String get className;

  @nullable
  @BuiltValueField(compare: false)
  DateTime get dueDate;

  TutorRequest._();
  factory TutorRequest([ u(TutorRequestBuilder b) ]) = _$TutorRequest;
}

abstract class Message implements Built<Message, MessageBuilder>, Unique {
  int get id;

  @BuiltValueField(compare: false)
  User get user;

  // should eventually support some kind of Markdown?
  @BuiltValueField(compare: false)
  String get rawText;

  @BuiltValueField(compare: false)
  DateTime get timestamp;

  @nullable
  @BuiltValueField(compare: false)
  BuiltList<Uri> get images;

  Message._();
  factory Message([ u(MessageBuilder b) ]) = _$Message;
}

abstract class Conversation implements Built<Conversation, ConversationBuilder>, Unique {
  int get id;

  @BuiltValueField(compare: false)
  BuiltList<User> get users;
  @BuiltValueField(compare: false)
  TutorRequest get request;

  @BuiltValueField(compare: false)
  BuiltList<Message> get messages;

  Conversation._();
  factory Conversation([ u(ConversationBuilder b) ]) = _$Conversation;
}

/*
Needs to go in network logic . . . eventually:

type Response {
  items: [T]!
  nextToken?: T
}

REST endpoints:

/users/self

/users/feed
/users/:id

/users/requests/feed/:id

/tutorReqs/feed
/tutorReqs/:id
/tutorReqs/:id

/tutorReqs/acceptedTutors/feed/:id

/conversations/feed
/conversations/:id

/messages/feed/:conversationId
/messages/:id
 */