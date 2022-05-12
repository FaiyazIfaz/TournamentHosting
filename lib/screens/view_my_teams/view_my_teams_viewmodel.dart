import '../../models/team.dart';
import '../viewmodel.dart';
import '../../app/dependencies.dart';
import '../user/user_viewmodel.dart';
import '../../models/token.dart';
import '../../services/auth/auth_service.dart';

class ViewMyTeamsViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  List<Team> _teams;

  get itemCount {
    if (_teams == null) return 0;
    return _teams.length;
  }

  Team getTeamByIndex(index) => _teams[index];

  UserViewmodel get _userViewmodel => dependency();
  Token get token => _userViewmodel.token;
  set token(Token value) => update(() async => _userViewmodel.token = value);
  set id(value) => _userViewmodel.selectedTeam = value;

  //final TeamService _service = dependency();

  ViewMyTeamsViewmodel() {
    getTeamList();
  }

  void getTeamList() async {
    turnBusy();
    _teams = await _service.getMyTeamsList(token);
    turnIdle();
  }
}
