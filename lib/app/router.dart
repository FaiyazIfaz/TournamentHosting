import 'package:exercise3/screens/find_team/find_team_screen.dart';
import 'package:flutter/material.dart';

import '../screens/login/login_screen.dart';
import '../screens/register/register_screen.dart';
import '../screens/main/main_screen.dart';
import '../screens/tournament_organizers_menu/tournament_organizer_screen.dart';
import '../screens/team_organizers_menu/team_organizer_screen.dart';
import '../screens/update_tournament/update_tournament_screen.dart';
import '../screens/manage_account/manage_account_screen.dart';
import '../screens/find_team/find_team_screen.dart';
import '../screens/find_tournament/find_tournament_screen.dart';
import '../screens/view_my_teams/view_my_teams_screen.dart';
import '../screens/create_team/create_team_screen.dart';
import '../screens/tournament_list/tournament_list_screen.dart';
import '../screens/manage_options/manage_options_screen.dart';
import '../screens/manage_optionsTeam/manage_options_screen.dart';
import '../screens/update_team/update_team_screen.dart';
import '../screens/member_list/member_list_screen.dart';
import '../screens/add_members/add_members_screen.dart';
import '../screens/add_teams/add_teams_screen.dart';
import '../screens/team_list/team_list_screen.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
    case '/main':
      return MainScreen.route();

    case '/login':
      return LoginScreen.route();
    case '/manage_options':
      return ManageOptionsScreen.route();
    case '/manage_optionsTeam':
      return ManageOptionsTeamScreen.route();
    case '/tournamentList':
      return TournamentListScreen.route();
    case '/manageAccount':
      return ManageAccountScreen.route();
    case '/Register':
      return RegisterScreen.route();
    case '/Organizer':
      return TournamentOrganizerScreen.route();
    case '/AddTeam':
      return TeamOrganizerScreen.route();
    case '/AddMember':
      return AddMembersScreen.route();
    case '/addParticipant':
      return AddTeamsScreen.route();
    case '/teamsList':
      return TeamListScreen.route();
    case '/updateTournament':
      return UpdateTournamentScreen.route();
    case '/FindTeam':
      return FindTeamScreen.route();
    case '/FindTournament':
      return FindTournamentScreen.route();
    case '/ViewMyTeams':
      return ViewMyTeamsScreen.route();
    case '/CreateTeam':
      return CreateTeamScreen.route();
    case '/updateTeam':
      return UpdateTeamScreen.route();
    case '/memberList':
      return MemberListScreen.route();
  }

  return null;
}
