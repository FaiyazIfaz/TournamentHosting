import 'package:exercise3/models/user.dart';
import 'package:flutter/material.dart';
import '../../view.dart';
import '../add_members_viewmodel.dart';

class Body extends StatelessWidget {
  final AddMembersViewmodel _findTeamViewmodel = AddMembersViewmodel();

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _findTeamViewmodel,
      builder: (_context, viewmodel, _child) {
        final AddMembersViewmodel _viewmodel = viewmodel;
        if (!_viewmodel.searched) {
          _viewmodel.search("");
          _viewmodel.searched = true;
        }
        return ListView.builder(
          itemCount: _viewmodel.searchCount,
          //itemCount: 3,
          itemBuilder: (context, index) {
            final User _user = _viewmodel.getSearchByIndex(index);
            return Card(
              child: ListTile(
                onTap: () {
                  _viewmodel.search("");
                  _viewmodel.addMember(_user.id);
                  Navigator.pop(context);
                },
                title: Text(_user.login),
                //title: Text("Team1"),
              ),
            );
          },
        );
      },
    );
  }
}
