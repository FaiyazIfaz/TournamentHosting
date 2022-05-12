import 'package:exercise3/models/tournament.dart';

import '../../app/dependencies.dart';
import '../../services/auth/auth_service.dart';
import '../../models/user.dart';
import '../../models/token.dart';
import '../../models/team.dart';
import '../viewmodel.dart';

class UserViewmodel extends Viewmodel {
  AuthService get _service => dependency();
  User _user;
  Token _token;
  int _selectedTournament;
  int _selectedUser;
  int _selectedTeam;
  bool _searchTo = false;
  bool _searchTe = false;
  bool _searchTee = false;

  List<Team> _teamsDisplayed = List();
  List<Team> _teamsDisplayed2 = List();
  List<Tournament> _tournamentsDisplayed = List();
  List<User> _usersDisplayed = List();

  bool _showPopup = false;

  get showPopup => _showPopup;
  set showPopup(value) => _showPopup = value;

  get teamsDisplayed => _teamsDisplayed;
  set teamsDisplayed(value) => _teamsDisplayed = value;

  get teamsDisplayed2 => _teamsDisplayed2;
  set teamsDisplayed2(value) => _teamsDisplayed2 = value;

  get usersDisplayed => _usersDisplayed;
  set usersDisplayed(value) => _usersDisplayed = value;

  get searchTe => _searchTe;
  set searchTe(value) => _searchTe = value;

  get searchTee => _searchTee;
  set searchTee(value) => _searchTee = value;

  get searchTo => _searchTo;
  set searchTo(value) => _searchTo = value;

  get tournamentsDisplayed => _tournamentsDisplayed;
  set tournamentsDisplayed(value) => _tournamentsDisplayed = value;

  get selectedTeam => _selectedTeam;
  set selectedTeam(value) => _selectedTeam = value;

  get selectedTournament => _selectedTournament;
  set selectedTournament(value) => _selectedTournament = value;

  get selectedUser => _selectedUser;
  set selectedUser(value) => _selectedUser = value;

  get token => _token;
  set token(value) => _token = value;

  get user => _user;
  set user(value) => _user = value;
  bool get isUserSignedIn => _user != null;

  void authenticate(User user) async {
    _token =
        await _service.authenticate(login: user.login, password: user.password);
    _user = _token.user;
  }
}
