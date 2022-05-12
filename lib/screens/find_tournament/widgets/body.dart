import 'package:exercise3/models/team.dart';
import 'package:exercise3/models/tournament.dart';
import 'package:flutter/material.dart';
import '../../view.dart';
import '../find_tournament_viewmodel.dart';

class Body extends StatelessWidget {
  final FindTournamentViewmodel _findTournamentViewmodel =
      FindTournamentViewmodel();
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _findTournamentViewmodel,
      builder: (_context, viewmodel, _child) {
        final FindTournamentViewmodel _viewmodel = viewmodel;
        if (!_viewmodel.searched) {
          _viewmodel.search("");
          _viewmodel.searched = true;
        }
        return ListView.builder(
          itemCount: _viewmodel.searchCount,
          //itemCount: 3,
          itemBuilder: (context, index) {
            final Tournament _tournament = _viewmodel.getSearchByIndex(index);
            return Card(
              child: ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context, _tournament),
                  );
                },
                title: Text(_tournament.name),
                //title: Text("Team1"),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPopupDialog(BuildContext context, Tournament tournament) {
    return new AlertDialog(
      title: Text("${tournament.name}'s description"),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${tournament.description}"),
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
