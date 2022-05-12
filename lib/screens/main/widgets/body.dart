import 'package:exercise3/screens/main/counter_viewmodel.dart';
import 'package:exercise3/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:exercise3/screens/main/main_viewmodel.dart';

class Body extends StatelessWidget {
  final MainViewmodel _viewmodel;
  const Body(MainViewmodel viewmodel) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: (_viewmodel.showPopup) ? _buildPopupDialog(context) : null,
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: Text(""),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Username or password is incorrect."),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            _viewmodel.showPopup = false;
            Navigator.of(context).pushReplacementNamed('/');
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
}
