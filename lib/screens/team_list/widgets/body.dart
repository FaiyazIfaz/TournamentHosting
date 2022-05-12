import 'package:flutter/material.dart';
import '../team_list_viewmodel.dart';
import '../../../models/team.dart';
import '../../view.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final double margin = 20.0;
  final TeamListViewmodel _memberListViewmodel = TeamListViewmodel();

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _memberListViewmodel,
      builder: (_context, viewmodel, _child) {
        final TeamListViewmodel _viewmodel = viewmodel;

        return ListView.builder(
          itemCount: _viewmodel.itemCount,
          //itemCount: 3,
          itemBuilder: (context, index) {
            final Team _team = _viewmodel.getTeamByIndex(index);
            return Card(
              child: ListTile(
                onTap: () {
                  //Navigator.pushNamed(context, '');
                },
                //title: Text(_user.login),
                title: Text("${_team.name}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        size: 20.0,
                        color: Colors.red[900],
                      ),
                      onPressed: () {
                        print('user id in body ${_team.id}');
                        _viewmodel.tobeDeleted = _team.id;
                        _viewmodel.remove();
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
