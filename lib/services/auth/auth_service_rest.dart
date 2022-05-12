import 'package:exercise3/models/tournament.dart';

import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../../models/token.dart';
import '../../models/team.dart';
import '../../models/tournament.dart';
import '../rest.dart';
import 'auth_service.dart';

class AuthServiceRest implements AuthService {
  RestService get rest => dependency();

  // Future<User> authenticate({String login, String password}) async {
  //   final List json = await rest.get('users/1');
  //   if (json == null || json.length == 0) return null;

  //   final _user = User.fromJson(json[0]);
  //   return _user;
  // }

  Future<Token> authenticate({String login, String password}) async {
    Map user = {'username': '$login', 'password': '$password'};
    final json = await rest.post('login', data: user);
    print('THIS IS THE RESPONSE: $json');
    if (json == null || json.length == 0) return null;

    rest.openSession(json['accessToken']);
    final _user = Token.fromJsonWithUserId(json);
    return _user;
  }

  Future<User> register({User user}) async {
    print('${user.toJson()}');
    final response = await rest.post('users', data: user.toJson());
    if (response == null || response.length == 0) return null;
    print("$response");
    final _user = User.fromJson(response);
    return _user;
  }

  Future<Tournament> createTournament(
      {Tournament tournament, Token token}) async {
    print('${tournament.toJson()}');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };

    final response = await rest.post('tournaments',
        data: tournament.toJson(), headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final _tournament = Tournament.fromJson(response);
    return _tournament;
  }

  Future<Team> createTeam({Team team, Token token}) async {
    print('${team.toJson()}');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    final response =
        await rest.post('teams', data: team.toJson(), headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final _team = Team.fromJson(response);
    return _team;
  }

  Future<List<Team>> getTeamList(Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    final response = await rest.get('teams', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<Team> _team = List();
    for (var i in response) {
      _team.add(Team.fromJson(i));
    }
    return _team;
  }

  Future<List<User>> getUserList(Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    final response = await rest.get('users', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<User> _user = List();
    for (var i in response) {
      _user.add(User.fromJsonWithId(i));
    }
    return _user;
  }

  Future<List<Tournament>> getTournamentList(Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    final response = await rest.get('tournaments', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<Tournament> _tournament = List();
    for (var i in response) {
      _tournament.add(Tournament.fromJson(i));
    }
    return _tournament;
  }

  Future<List<Team>> getMyTeamsList(Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    final response =
        await rest.get('teams/creator/${token.user.id}', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<Team> _team = List();
    for (var i in response) {
      _team.add(Team.fromJson(i));
    }
    return _team;
  }

  Future<List<Tournament>> getTournamentByCreator(Token token, int user) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    print('User is $user');
    final response =
        await rest.get('tournaments/creator/$user', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<Tournament> _tournament = List();
    for (var i in response) {
      _tournament.add(Tournament.fromJson(i));
    }
    return _tournament;
  }

  Future<Tournament> updateTournament(
      {Tournament tournament, Token token}) async {
    print('${tournament.toJson()}');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    var data = tournament.toJson();
    print('$data');

    final response =
        await rest.put('tournaments', data: data, headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final _tournament = Tournament.fromJson(response);
    return _tournament;
  }

  Future<Team> updateTeam({Team team, Token token}) async {
    print('${team.toJson()}');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };

    var data = team.toJson();
    print('$data');

    final response = await rest.put('teams', data: data, headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final _team = Team.fromJson(response);
    return _team;
  }

  Future<User> updateUser({User user, Token token}) async {
    print('${user.toJson()}');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    final response =
        await rest.put('users', data: user.toJson(), headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final _user = User.fromJson(response);
    return _user;
  }

  Future<List<User>> getUsersByTeam(int team, Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    final response = await rest.get('users/team/$team', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<User> _user = List();
    for (var i in response) {
      _user.add(User.fromJsonWithId(i));
    }
    return _user;
  }

  Future<List<User>> removeUserTeam(int user, Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };

    final response = await rest.delete('users/team/$user', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<User> _user = List();
    for (var i in response) {
      _user.add(User.fromJsonWithId(i));
    }
    return _user;
  }

  Future<List<User>> addUserTeam(int user, int team, Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };

    final response = await rest.put('users/$user/team/$team', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<User> _user = List();
    for (var i in response) {
      _user.add(User.fromJsonWithId(i));
    }
    return _user;
  }

  Future<List<Team>> getTeamsByTournament(int tournament, Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    final response =
        await rest.get('teams/tournament/$tournament', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<Team> _team = List();
    for (var i in response) {
      _team.add(Team.fromJson(i));
    }
    return _team;
  }

  Future<List<Team>> removeTeamTournament(int team, Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };

    final response =
        await rest.delete('teams/tournament/$team', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<Team> _team = List();
    for (var i in response) {
      _team.add(Team.fromJson(i));
    }
    return _team;
  }

  Future<List<Team>> addTeamTournament(
      int team, int tournament, Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };

    final response =
        await rest.put('teams/$team/tournament/$tournament', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<Team> _team = List();
    for (var i in response) {
      _team.add(Team.fromJson(i));
    }
    return _team;
  }

  Future<List<Team>> getTeamsByNoTournament(Token token) async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token.token}'
    };
    final response = await rest.get('teams/tournament/', headers: headers);
    if (response == null || response.length == 0) return null;
    print("$response");
    final List<Team> _team = List();
    for (var i in response) {
      _team.add(Team.fromJson(i));
    }
    return _team;
  }
}
