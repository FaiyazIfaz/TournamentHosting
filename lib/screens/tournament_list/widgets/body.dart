import 'package:flutter/material.dart';
import '../tournament_list_viewmodel.dart';
import '../../../models/tournament.dart';
import '../../view.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final double margin = 20.0;
  final TournamentListViewmodel _tournamentListViewmodel =
      TournamentListViewmodel();

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _tournamentListViewmodel,
      builder: (_context, viewmodel, _child) {
        final TournamentListViewmodel _viewmodel = viewmodel;

        return ListView.builder(
          itemCount: _viewmodel.itemCount,
          //itemCount: 3,
          itemBuilder: (context, index) {
            final Tournament _tournament =
                _viewmodel.getTournamentByIndex(index);
            return Card(
              child: ListTile(
                onTap: () {
                  _viewmodel.id = _tournament.id;
                  Navigator.pushNamed(context, '/manage_options');
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
}
