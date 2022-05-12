import '../../models/tournament.dart';
import '../viewmodel.dart';
import '../../app/dependencies.dart';
import '../user/user_viewmodel.dart';
import '../../models/token.dart';
import '../../services/auth/auth_service.dart';

class FindTournamentViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  List<Tournament> _tournaments;

  String searchString = "";

  List get tournamentsDisplayed => _userViewmodel.tournamentsDisplayed;
  set tournamentsDisplayed(value) =>
      update(() async => _userViewmodel.tournamentsDisplayed = value);

  bool get searched => _userViewmodel.searchTe;
  set searched(value) => update(() async => _userViewmodel.searchTe = value);

  get itemCount => _tournaments.length;
  Tournament getTournamentByIndex(index) => _tournaments[index];

  get searchCount => tournamentsDisplayed.length;
  Tournament getSearchByIndex(index) => tournamentsDisplayed[index];

  UserViewmodel get _userViewmodel => dependency();
  Token get token => _userViewmodel.token;
  set token(Token value) => update(() async => _userViewmodel.token = value);

  //final TeamService _service = dependency();

  FindTournamentViewmodel() {
    getTournamentList();
  }

  void getTournamentList() async {
    turnBusy();
    _tournaments = await _service.getTournamentList(token);
    turnIdle();
  }

  void search(String value) {
    tournamentsDisplayed.clear();
    for (int i = 0; i < _tournaments.length; i++) {
      Tournament data = _tournaments[i];
      if (data.name.toString().toLowerCase().contains(value.toLowerCase())) {
        tournamentsDisplayed.add(data);
      }
    }
    searchString = value;
    print("$tournamentsDisplayed");
  }
}
