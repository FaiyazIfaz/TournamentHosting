import '../../models/team.dart';
import '../viewmodel.dart';
import '../../services/auth/auth_service.dart';
import '../../app/dependencies.dart';
import '../user/user_viewmodel.dart';
import '../../models/token.dart';

class CreateTeamViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  Team _team = Team();

  UserViewmodel get _userViewmodel => dependency();
  Token get token => _userViewmodel.token;
  set token(Token value) => update(() async => _userViewmodel.token = value);

  get team => _team;
  set team(value) => _team = value;

  get name => _team.name;
  set name(value) {
    _team.name = value;
  }

  get capacity => _team.capacity;
  set capacity(value) {
    _team.capacity = value;
  }

  get description => _team.description;
  set description(value) {
    _team.description = value;
  }

  Future<Team> createTeam() async {
    turnBusy();
    Team req = _team;

    print('token being sent: ${token.token}');
    final Team _res = await _service.createTeam(team: req, token: token);

    turnIdle();
    return _res;
  }
}
