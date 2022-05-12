import 'package:exercise3/screens/main/main_viewmodel.dart';
import 'package:flutter/material.dart';

import './bar.dart';
import '../../../../models/token.dart';
import '../../../../models/user.dart';

class UnsignedInBar extends Bar {
  final MainViewmodel _viewmodel;
  const UnsignedInBar(viewmodel) : _viewmodel = viewmodel;

  @override
  Widget build(BuildContext context) {
    return Bar(
        title: 'Please log in',
        image: AssetImage('assets/images/unknown_user.png'),
        button: IconButton(
            icon: Icon(Icons.login),
            onPressed: () => _onPressLoginButton(context)));
  }

  void _onPressLoginButton(context) async {
    final _token = await Navigator.pushNamed(context, '/login');
    if (_token == 'error') {
      _viewmodel.showPopup = true;
      Navigator.of(context).pushReplacementNamed('/');
    }
    Token temp = _token;
    final _user = temp.user;

    if (_user != null) {
      _viewmodel.token = _token;
      _viewmodel.user = _user;
      if (_user.type == 1) {
        var signout = await Navigator.pushNamed(context, '/Organizer');
        print("$signout");
        if (signout == "yes") {
          _viewmodel.user = null;
        }
      } else {
        var signout = await Navigator.pushNamed(context, '/AddTeam');
        print("$signout");
        if (signout == "yes") {
          _viewmodel.user = null;
        }
      }
    } else {}
  }
}
