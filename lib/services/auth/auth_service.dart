import '../../models/user.dart';
import '../../models/token.dart';
import '../../models/tournament.dart';
import '../../models/team.dart';

abstract class AuthService {
  Future<Token> authenticate({String login, String password});
  Future<User> register({User user});
  Future<Tournament> createTournament({Tournament tournament, Token token});
  Future<Team> createTeam({Team team, Token token});
  Future<List<Team>> getTeamList(Token token);
  Future<List<User>> getUserList(Token token);
  Future<List<Team>> getMyTeamsList(Token token);
  Future<List<Tournament>> getTournamentList(Token token);
  Future<List<Tournament>> getTournamentByCreator(Token token, int user);
  Future<Tournament> updateTournament({Tournament tournament, Token token});
  Future<Team> updateTeam({Team team, Token token});
  Future<User> updateUser({User user, Token token});
  Future<List<User>> getUsersByTeam(int team, Token token);
  Future<List<User>> removeUserTeam(int user, Token token);
  Future<List<User>> addUserTeam(int user, int team, Token token);
  Future<List<Team>> getTeamsByTournament(int tournament, Token token);
  Future<List<Team>> removeTeamTournament(int team, Token token);
  Future<List<Team>> addTeamTournament(int team, int tournament, Token token);
  Future<List<Team>> getTeamsByNoTournament(Token token);
}
