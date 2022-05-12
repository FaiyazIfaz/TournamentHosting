import '../app/dependencies.dart';
import 'rest.dart';
import '../models/team.dart';

class TeamService {
  final RestService rest = dependency();

  Future<List<Team>> getTeamList() async {
    final listJson = await rest.get('teams');

    return (listJson as List)
        .map((itemJson) => Team.fromJson(itemJson))
        .toList();
  }
}
