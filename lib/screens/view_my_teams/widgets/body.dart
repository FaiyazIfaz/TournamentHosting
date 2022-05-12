import 'package:exercise3/models/team.dart';
import 'package:flutter/material.dart';
import '../../view.dart';
import '../view_my_teams_viewmodel.dart';

class Body extends StatelessWidget {
  final ViewMyTeamsViewmodel _findTeamViewmodel = ViewMyTeamsViewmodel();
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _findTeamViewmodel,
      builder: (_context, viewmodel, _child) {
        final ViewMyTeamsViewmodel _viewmodel = viewmodel;

        return ListView.builder(
          itemCount: _viewmodel.itemCount,
          //itemCount: 3,
          itemBuilder: (context, index) {
            final Team _team = _viewmodel.getTeamByIndex(index);
            return Card(
              child: ListTile(
                onTap: () {
                  _viewmodel.id = _team.id;
                  Navigator.pushNamed(context, '/manage_optionsTeam');
                },
                title: Text(_team.name),
                //title: Text("Team1"),
              ),
            );
          },
        );
      },
    );
  }
}
