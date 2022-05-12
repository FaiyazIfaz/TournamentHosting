import '../../models/tournament.dart';
import '../viewmodel.dart';
import '../../app/dependencies.dart';
import '../user/user_viewmodel.dart';
import '../../models/token.dart';
import '../../services/auth/auth_service.dart';

class TournamentListViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  List<Tournament> _tournaments;

  get itemCount {
    if (_tournaments == null) return 0;
    return _tournaments.length;
  }

  Tournament getTournamentByIndex(index) => _tournaments[index];

  UserViewmodel get _userViewmodel => dependency();
  Token get token => _userViewmodel.token;

  set id(value) => _userViewmodel.selectedTournament = value;

  set token(Token value) => update(() async => _userViewmodel.token = value);

  //final TeamService _service = dependency();

  TournamentListViewmodel() {
    getTournamentList();
  }

  void getTournamentList() async {
    turnBusy();
    _tournaments =
        await _service.getTournamentByCreator(token, _userViewmodel.user.id);
    turnIdle();
  }
}
