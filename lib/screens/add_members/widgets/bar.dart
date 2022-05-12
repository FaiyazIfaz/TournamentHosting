import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../../view.dart';
import '../add_members_viewmodel.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  final AddMembersViewmodel _findTeamViewmodel = AddMembersViewmodel();

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _findTeamViewmodel,
        builder: (_context, viewmodel, _child) {
          final AddMembersViewmodel _viewmodel = viewmodel;
          return FloatingSearchAppBar(
            automaticallyImplyBackButton: false,
            color: Colors.blue,
            iconColor: Colors.white,
            title: Text(
              "Add Members",
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
              Navigator.pushReplacementNamed(context, '/AddMember');
            },
          );
        });
  }
}
