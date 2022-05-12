import 'package:exercise3/models/team.dart';
import 'package:flutter/material.dart';
import '../../view.dart';
import '../add_teams_viewmodel.dart';

class Body extends StatelessWidget {
  final AddTeamsViewmodel _findTeamViewmodel = AddTeamsViewmodel();

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _findTeamViewmodel,
      builder: (_context, viewmodel, _child) {
        final AddTeamsViewmodel _viewmodel = viewmodel;
        if (!_viewmodel.searched) {
          _viewmodel.search("");
          _viewmodel.searched = true;
        }
        return ListView.builder(
          itemCount: _viewmodel.searchCount,
          //itemCount: 3,
          itemBuilder: (context, index) {
            final Team _team = _viewmodel.getSearchByIndex(index);
            return Card(
              child: ListTile(
                onTap: () {
                  _viewmodel.search("");
                  _viewmodel.addMember(_team.id);
                  Navigator.pop(context);
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
