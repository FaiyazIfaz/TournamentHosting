import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../../models/user.dart';
import '../viewmodel.dart';

class RegisterViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  User _user = User();
  bool _showPassword = false;
  bool _showErrorMessage = false;
  String _confPassword = "";

  get user => _user;
  set user(value) => _user = value;

  get email => _user.email;
  set email(value) => _user.email = value;

  get type => _user.type;

  get stringType {
    if (_user.type == 0) {
      return "Player";
    }
    if (_user.type == 1) {
      return "Host";
    }
  }

  set type(value) {
    turnBusy();
    if (value == "Player") {
      _user.type = 0;
    } else {
      _user.type = 1;
    }
    turnIdle();
  }

  get showPassword => _showPassword;
  set showPassword(value) {
    turnBusy();
    _showPassword = value;
    turnIdle();
  }

  get showErrorMessage => _showErrorMessage;
  set showErrorMessage(value) {
    turnBusy();
    _showErrorMessage = value;
    turnIdle();
  }

  get username => _user.login;
  set username(value) {
    turnBusy();
    _showErrorMessage = false;
    _user.login = value;
    turnIdle();
  }

  get password => _user.password;
  set password(value) {
    turnBusy();
    _showErrorMessage = false;
    _user.password = value;
    turnIdle();
  }

  get confPassword => _confPassword;
  set confPassword(value) {
    turnBusy();
    _showErrorMessage = false;
    _confPassword = value;
    turnIdle();
  }

  Future<User> register() async {
    turnBusy();
    User req =
        User(email: email, login: username, type: type, password: password);

    final User _user = await _service.register(user: req);

    if (_user == null) _showErrorMessage = true;
    turnIdle();
    return _user;
  }
}
