import 'package:exercise3/models/team.dart';
import 'package:flutter/material.dart';
import '../../view.dart';
import '../find_team_viewmodel.dart';

class Body extends StatelessWidget {
  final FindTeamViewmodel _findTeamViewmodel = FindTeamViewmodel();

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _findTeamViewmodel,
      builder: (_context, viewmodel, _child) {
        final FindTeamViewmodel _viewmodel = viewmodel;
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context, _team),
                  );
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

  Widget _buildPopupDialog(BuildContext context, Team team) {
    return new AlertDialog(
      title: Text("${team.name}'s description"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${team.description}"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
}
