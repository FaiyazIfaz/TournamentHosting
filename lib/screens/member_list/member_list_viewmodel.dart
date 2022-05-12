import '../../models/user.dart';
import '../viewmodel.dart';
import '../../app/dependencies.dart';
import '../user/user_viewmodel.dart';
import '../../models/token.dart';
import '../../services/auth/auth_service.dart';

class MemberListViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  List<User> _users;
  int _tobeDeleted;

  get tobeDeleted => _tobeDeleted;
  set tobeDeleted(value) => _tobeDeleted = value;

  UserViewmodel get _userViewmodel => dependency();

  List get usersDisplayed => _userViewmodel.usersDisplayed;

  int get teamId => _userViewmodel.selectedTeam;

  get itemCount {
    if (_users != null) {
      return _users.length;
    } else {
      return 0;
    }
  }

  User getUserByIndex(index) => _users[index];

  Token get token => _userViewmodel.token;

  set token(Token value) => update(() async => _userViewmodel.token = value);
  set id(value) => _userViewmodel.selectedUser = value;

  //final TeamService _service = dependency();

  MemberListViewmodel() {
    getUserList();
  }

  void getUserList() async {
    turnBusy();
    _users = await _service.getUsersByTeam(teamId, token);
    turnIdle();
  }

  void remove() async {
    print('ID IS HERE ${_tobeDeleted}');

    turnBusy();
    _users = await _service.removeUserTeam(_tobeDeleted, token);
    turnIdle();
  }
}
