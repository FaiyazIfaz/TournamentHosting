import 'user.dart';

class Token {
  String _token;
  User _user;

  // ignore: unnecessary_getters_setters
  get user => _user;
  // ignore: unnecessary_getters_setters
  set user(value) => _user = value;

  get token => _token;
  set token(value) => _token = value;

  Token({
    User user = null,
    String token = '',
  })  : _user = user,
        _token = token;

  Token.copy(Token from) : this(token: from.token, user: from.user);

  Token.fromJson(Map<String, dynamic> json)
      : this(
          user: User.fromJson(json['user']),
          token: json['accessToken'],
        );

  Token.fromJsonWithUserId(Map<String, dynamic> json)
      : this(
          user: User.fromJsonWithId(json['user']),
          token: json['accessToken'],
        );

  Map<String, dynamic> toJson() => {
        'Authorization': "Bearer $token",
      };
}
