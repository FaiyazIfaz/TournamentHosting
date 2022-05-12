class User {
  dynamic
      _id; // Use dynamic type because json-server id is int and firestore id is string
  String _email;
  String _login;
  String _password;
  int _type;

  // ignore: unnecessary_getters_setters
  get id => _id;
  // ignore: unnecessary_getters_setters
  set id(value) => _id = value;

  get email => _email;
  set email(value) => _email = value;

  get type => _type;
  set type(value) => _type = value;

  get login => _login;
  set login(value) => _login = value;

  get password => _password;
  set password(value) => _password = value;

  User(
      {dynamic id,
      int type,
      String email = '',
      String login = '',
      String password = ''})
      : _id = id,
        _email = email,
        _type = type,
        _login = login,
        _password = password;
  User.copy(User from)
      : this(
            id: from.id,
            email: from.email,
            type: from.type,
            login: from.login,
            password: from.password);

  User.fromJson(Map<String, dynamic> json)
      : this(
          type: json['type'],
          email: json['email'],
          login: json['username'],
          password: json['password'],
        );

  User.fromJsonWithId(Map<String, dynamic> json)
      : this(
          id: json['id'],
          type: json['type'],
          email: json['email'],
          login: json['username'],
          password: json['password'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'email': email,
        'username': login,
        'password': password,
      };
}
