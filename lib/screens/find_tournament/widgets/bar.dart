import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../find_tournament_viewmodel.dart';
import '../../view.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  final FindTournamentViewmodel _findTournamentViewmodel =
      FindTournamentViewmodel();

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _findTournamentViewmodel,
        builder: (_context, viewmodel, _child) {
          final FindTournamentViewmodel _viewmodel = viewmodel;
          return FloatingSearchAppBar(
            automaticallyImplyBackButton: false,
            iconColor: Colors.white,
            color: Colors.blue,
            accentColor: Colors.white,
            title: Text(
              "Find Tournament",
              style: TextStyle(color: Colors.white),
            ),
            leadingActions: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    _viewmodel.search("");
                    Navigator.pop(context);
                  }),
            ],
            onQueryChanged: (value) {
              _viewmodel.search(value);
            },
            onSubmitted: (value) {
              Navigator.pushReplacementNamed(context, '/FindTournament');
            },
          );
        });
  }
}
