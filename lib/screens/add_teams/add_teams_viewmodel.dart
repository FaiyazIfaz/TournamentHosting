import 'package:exercise3/models/team.dart';

import '../../models/user.dart';
import '../viewmodel.dart';
import '../../app/dependencies.dart';
import '../user/user_viewmodel.dart';
import '../../models/token.dart';
import '../../services/auth/auth_service.dart';

class AddTeamsViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  List<Team> _teams;

  List get teamsDisplayed => _userViewmodel.teamsDisplayed;
  set teamsDisplayed(value) =>
      update(() async => _userViewmodel.teamsDisplayed = value);

  String searchString = "";

  bool get searched => _userViewmodel.searchTe;
  set searched(value) => update(() async => _userViewmodel.searchTe = value);

  get itemCount {
    if (_teams != null) {
      return _teams.length;
    } else {
      return 0;
    }
  }

  get searchCount {
    if (teamsDisplayed != null) {
      return teamsDisplayed.length;
    } else {
      return 0;
    }
  }

  Team getUserByIndex(index) => _teams[index];

  Team getSearchByIndex(index) => teamsDisplayed[index];

  UserViewmodel get _userViewmodel => dependency();
  Token get token => _userViewmodel.token;
  set token(Token value) => update(() async => _userViewmodel.token = value);

  //final TeamService _service = dependency();

  AddTeamsViewmodel() {
    getTeamList();
  }

  void getTeamList() async {
    turnBusy();
    _teams = await _service.getTeamList(token);
    turnIdle();
  }

  void search(String value) {
    teamsDisplayed.clear();
    for (int i = 0; i < itemCount; i++) {
      Team data = _teams[i];
      if (data.name.toString().toLowerCase().contains(value.toLowerCase())) {
        teamsDisplayed.add(data);
      }
    }
    searchString = value;
    print("$teamsDisplayed");
  }

  void addMember(int id) async {
    turnBusy();
    _teams = await _service.addTeamTournament(
        id, _userViewmodel.selectedTournament, token);
    turnIdle();
  }
}
