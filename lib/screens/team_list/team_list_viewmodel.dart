import 'package:exercise3/models/team.dart';

import '../../models/user.dart';
import '../viewmodel.dart';
import '../../app/dependencies.dart';
import '../user/user_viewmodel.dart';
import '../../models/token.dart';
import '../../services/auth/auth_service.dart';

class TeamListViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  List<Team> _teams;
  int _tobeDeleted;

  get tobeDeleted => _tobeDeleted;
  set tobeDeleted(value) => _tobeDeleted = value;

  UserViewmodel get _userViewmodel => dependency();

  List get usersDisplayed => _userViewmodel.teamsDisplayed;

  int get tournamentId => _userViewmodel.selectedTournament;

  get itemCount {
    if (_teams != null) {
      return _teams.length;
    } else {
      return 0;
    }
  }

  Team getTeamByIndex(index) => _teams[index];

  Token get token => _userViewmodel.token;

  set token(Token value) => update(() async => _userViewmodel.token = value);
  set id(value) => _userViewmodel.selectedUser = value;

  //final TeamService _service = dependency();

  TeamListViewmodel() {
    getTournamentList();
  }

  void getTournamentList() async {
    turnBusy();
    _teams = await _service.getTeamsByTournament(tournamentId, token);
    turnIdle();
  }

  void remove() async {
    print('ID IS HERE ${_tobeDeleted}');

    turnBusy();
    _teams = await _service.removeTeamTournament(_tobeDeleted, token);
    turnIdle();
  }
}
