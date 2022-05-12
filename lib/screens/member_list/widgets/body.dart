import 'package:flutter/material.dart';
import '../member_list_viewmodel.dart';
import '../../../models/user.dart';
import '../../view.dart';

class Body extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final double margin = 20.0;
  final MemberListViewmodel _memberListViewmodel = MemberListViewmodel();

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _memberListViewmodel,
      builder: (_context, viewmodel, _child) {
        final MemberListViewmodel _viewmodel = viewmodel;

        return ListView.builder(
          itemCount: _viewmodel.itemCount,
          //itemCount: 3,
          itemBuilder: (context, index) {
            final User _user = _viewmodel.getUserByIndex(index);
            return Card(
              child: ListTile(
                onTap: () {
                  //Navigator.pushNamed(context, '');
                },
                //title: Text(_user.login),
                title: Text("${_user.login}"),
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
                        print('user id in body ${_user.id}');
                        _viewmodel.tobeDeleted = _user.id;
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
