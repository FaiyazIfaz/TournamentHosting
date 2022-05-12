import '../../models/tournament.dart';
import '../../models/token.dart';
import '../viewmodel.dart';
import '../user/user_viewmodel.dart';
import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';

class UpdateTournamentViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  Tournament _tournament = Tournament();

  UserViewmodel get _userViewmodel => dependency();
  int get id => _userViewmodel.selectedTournament;
  Token get token => _userViewmodel.token;

  get tournament => _tournament;
  set tournament(value) => _tournament = value;

  get name => _tournament.name;
  set name(value) {
    _tournament.name = value;
  }

  get skillLevel => _tournament.skillLevel;
  set skillLevel(value) {
    _tournament.skillLevel = value;
  }

  get prizePool => _tournament.prizePool;
  set prizePool(value) {
    _tournament.prizePool = value;
  }

  get description => _tournament.description;
  set description(value) {
    _tournament.description = value;
  }

  Future<Tournament> updateTournament() async {
    turnBusy();
    Tournament req = _tournament;
    req.id = id;

    final Tournament _res =
        await _service.updateTournament(tournament: req, token: token);

    turnIdle();
    return _res;
  }
}
