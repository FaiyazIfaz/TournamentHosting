import '../../models/user.dart';
import '../viewmodel.dart';
import '../../app/dependencies.dart';
import '../user/user_viewmodel.dart';
import '../../models/token.dart';
import '../../services/auth/auth_service.dart';

class AddMembersViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  List<User> _users;

  List get teamsDisplayed => _userViewmodel.usersDisplayed;
  set teamsDisplayed(value) =>
      update(() async => _userViewmodel.teamsDisplayed = value);

  String searchString = "";

  bool get searched => _userViewmodel.searchTe;
  set searched(value) => update(() async => _userViewmodel.searchTe = value);

  get itemCount => _users.length;
  get searchCount => teamsDisplayed.length;

  User getUserByIndex(index) => _users[index];

  User getSearchByIndex(index) => teamsDisplayed[index];

  UserViewmodel get _userViewmodel => dependency();
  Token get token => _userViewmodel.token;
  set token(Token value) => update(() async => _userViewmodel.token = value);

  //final TeamService _service = dependency();

  AddMembersViewmodel() {
    getUserList();
  }

  void getUserList() async {
    turnBusy();
    _users = await _service.getUserList(token);
    turnIdle();
  }

  void search(String value) {
    teamsDisplayed.clear();
    for (int i = 0; i < _users.length; i++) {
      User data = _users[i];
      if (data.login.toString().toLowerCase().contains(value.toLowerCase())) {
        teamsDisplayed.add(data);
      }
    }
    searchString = value;
    print("$teamsDisplayed");
  }

  void addMember(int id) async {
    turnBusy();
    _users = await _service.addUserTeam(id, _userViewmodel.selectedTeam, token);
    turnIdle();
  }
}
