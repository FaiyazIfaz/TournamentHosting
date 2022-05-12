import '../../models/tournament.dart';
import '../viewmodel.dart';
import '../../services/auth/auth_service.dart';
import '../../app/dependencies.dart';
import '../user/user_viewmodel.dart';
import '../../models/token.dart';

class CreateTournamentViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  Tournament _tournament = Tournament();

  UserViewmodel get _userViewmodel => dependency();
  Token get token => _userViewmodel.token;
  set token(Token value) => update(() async => _userViewmodel.token = value);

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

  Future<Tournament> createTournament() async {
    turnBusy();
    Tournament req = _tournament;

    final Tournament _res =
        await _service.createTournament(tournament: req, token: token);

    turnIdle();
    return _res;
  }
}
