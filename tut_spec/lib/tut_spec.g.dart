// GENERATED CODE - DO NOT MODIFY BY HAND

part of tut_spec;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

class _$User extends User {
  @override
  final int id;
  @override
  final String name;
  @override
  final Uri avatarUri;
  @override
  final bool verified;
  @override
  final double rating;

  factory _$User([void updates(UserBuilder b)]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._({this.id, this.name, this.avatarUri, this.verified, this.rating})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('User', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('User', 'name');
    }
    if (verified == null) {
      throw new BuiltValueNullFieldError('User', 'verified');
    }
    if (rating == null) {
      throw new BuiltValueNullFieldError('User', 'rating');
    }
  }

  @override
  User rebuild(void updates(UserBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('id', id)
          ..add('name', name)
          ..add('avatarUri', avatarUri)
          ..add('verified', verified)
          ..add('rating', rating))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  Uri _avatarUri;
  Uri get avatarUri => _$this._avatarUri;
  set avatarUri(Uri avatarUri) => _$this._avatarUri = avatarUri;

  bool _verified;
  bool get verified => _$this._verified;
  set verified(bool verified) => _$this._verified = verified;

  double _rating;
  double get rating => _$this._rating;
  set rating(double rating) => _$this._rating = rating;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _avatarUri = _$v.avatarUri;
      _verified = _$v.verified;
      _rating = _$v.rating;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void updates(UserBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    final _$result = _$v ??
        new _$User._(
            id: id,
            name: name,
            avatarUri: avatarUri,
            verified: verified,
            rating: rating);
    replace(_$result);
    return _$result;
  }
}

class _$TutorRequest extends TutorRequest {
  @override
  final int id;
  @override
  final User user;
  @override
  final BuiltList<User> acceptedTutors;
  @override
  final String assignment;
  @override
  final String className;
  @override
  final DateTime dueDate;

  factory _$TutorRequest([void updates(TutorRequestBuilder b)]) =>
      (new TutorRequestBuilder()..update(updates)).build();

  _$TutorRequest._(
      {this.id,
      this.user,
      this.acceptedTutors,
      this.assignment,
      this.className,
      this.dueDate})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('TutorRequest', 'id');
    }
    if (user == null) {
      throw new BuiltValueNullFieldError('TutorRequest', 'user');
    }
    if (acceptedTutors == null) {
      throw new BuiltValueNullFieldError('TutorRequest', 'acceptedTutors');
    }
    if (assignment == null) {
      throw new BuiltValueNullFieldError('TutorRequest', 'assignment');
    }
    if (className == null) {
      throw new BuiltValueNullFieldError('TutorRequest', 'className');
    }
  }

  @override
  TutorRequest rebuild(void updates(TutorRequestBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TutorRequestBuilder toBuilder() => new TutorRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TutorRequest && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TutorRequest')
          ..add('id', id)
          ..add('user', user)
          ..add('acceptedTutors', acceptedTutors)
          ..add('assignment', assignment)
          ..add('className', className)
          ..add('dueDate', dueDate))
        .toString();
  }
}

class TutorRequestBuilder
    implements Builder<TutorRequest, TutorRequestBuilder> {
  _$TutorRequest _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  ListBuilder<User> _acceptedTutors;
  ListBuilder<User> get acceptedTutors =>
      _$this._acceptedTutors ??= new ListBuilder<User>();
  set acceptedTutors(ListBuilder<User> acceptedTutors) =>
      _$this._acceptedTutors = acceptedTutors;

  String _assignment;
  String get assignment => _$this._assignment;
  set assignment(String assignment) => _$this._assignment = assignment;

  String _className;
  String get className => _$this._className;
  set className(String className) => _$this._className = className;

  DateTime _dueDate;
  DateTime get dueDate => _$this._dueDate;
  set dueDate(DateTime dueDate) => _$this._dueDate = dueDate;

  TutorRequestBuilder();

  TutorRequestBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _user = _$v.user?.toBuilder();
      _acceptedTutors = _$v.acceptedTutors?.toBuilder();
      _assignment = _$v.assignment;
      _className = _$v.className;
      _dueDate = _$v.dueDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TutorRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TutorRequest;
  }

  @override
  void update(void updates(TutorRequestBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TutorRequest build() {
    _$TutorRequest _$result;
    try {
      _$result = _$v ??
          new _$TutorRequest._(
              id: id,
              user: user.build(),
              acceptedTutors: acceptedTutors.build(),
              assignment: assignment,
              className: className,
              dueDate: dueDate);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
        _$failedField = 'acceptedTutors';
        acceptedTutors.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TutorRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Message extends Message {
  @override
  final int id;
  @override
  final User user;
  @override
  final String rawText;
  @override
  final DateTime timestamp;
  @override
  final BuiltList<Uri> images;

  factory _$Message([void updates(MessageBuilder b)]) =>
      (new MessageBuilder()..update(updates)).build();

  _$Message._({this.id, this.user, this.rawText, this.timestamp, this.images})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Message', 'id');
    }
    if (user == null) {
      throw new BuiltValueNullFieldError('Message', 'user');
    }
    if (rawText == null) {
      throw new BuiltValueNullFieldError('Message', 'rawText');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('Message', 'timestamp');
    }
  }

  @override
  Message rebuild(void updates(MessageBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageBuilder toBuilder() => new MessageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Message && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Message')
          ..add('id', id)
          ..add('user', user)
          ..add('rawText', rawText)
          ..add('timestamp', timestamp)
          ..add('images', images))
        .toString();
  }
}

class MessageBuilder implements Builder<Message, MessageBuilder> {
  _$Message _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  String _rawText;
  String get rawText => _$this._rawText;
  set rawText(String rawText) => _$this._rawText = rawText;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  ListBuilder<Uri> _images;
  ListBuilder<Uri> get images => _$this._images ??= new ListBuilder<Uri>();
  set images(ListBuilder<Uri> images) => _$this._images = images;

  MessageBuilder();

  MessageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _user = _$v.user?.toBuilder();
      _rawText = _$v.rawText;
      _timestamp = _$v.timestamp;
      _images = _$v.images?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Message other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Message;
  }

  @override
  void update(void updates(MessageBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Message build() {
    _$Message _$result;
    try {
      _$result = _$v ??
          new _$Message._(
              id: id,
              user: user.build(),
              rawText: rawText,
              timestamp: timestamp,
              images: _images?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();

        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Message', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Conversation extends Conversation {
  @override
  final int id;
  @override
  final BuiltList<User> users;
  @override
  final TutorRequest request;
  @override
  final BuiltList<Message> messages;

  factory _$Conversation([void updates(ConversationBuilder b)]) =>
      (new ConversationBuilder()..update(updates)).build();

  _$Conversation._({this.id, this.users, this.request, this.messages})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Conversation', 'id');
    }
    if (users == null) {
      throw new BuiltValueNullFieldError('Conversation', 'users');
    }
    if (request == null) {
      throw new BuiltValueNullFieldError('Conversation', 'request');
    }
    if (messages == null) {
      throw new BuiltValueNullFieldError('Conversation', 'messages');
    }
  }

  @override
  Conversation rebuild(void updates(ConversationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ConversationBuilder toBuilder() => new ConversationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Conversation && id == other.id;
  }

  @override
  int get hashCode {
    return $jf($jc(0, id.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Conversation')
          ..add('id', id)
          ..add('users', users)
          ..add('request', request)
          ..add('messages', messages))
        .toString();
  }
}

class ConversationBuilder
    implements Builder<Conversation, ConversationBuilder> {
  _$Conversation _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  TutorRequestBuilder _request;
  TutorRequestBuilder get request =>
      _$this._request ??= new TutorRequestBuilder();
  set request(TutorRequestBuilder request) => _$this._request = request;

  ListBuilder<Message> _messages;
  ListBuilder<Message> get messages =>
      _$this._messages ??= new ListBuilder<Message>();
  set messages(ListBuilder<Message> messages) => _$this._messages = messages;

  ConversationBuilder();

  ConversationBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _users = _$v.users?.toBuilder();
      _request = _$v.request?.toBuilder();
      _messages = _$v.messages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Conversation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Conversation;
  }

  @override
  void update(void updates(ConversationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Conversation build() {
    _$Conversation _$result;
    try {
      _$result = _$v ??
          new _$Conversation._(
              id: id,
              users: users.build(),
              request: request.build(),
              messages: messages.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        users.build();
        _$failedField = 'request';
        request.build();
        _$failedField = 'messages';
        messages.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Conversation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
