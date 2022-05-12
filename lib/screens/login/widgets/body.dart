import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../models/token.dart';
import '../../view.dart';
import '../login_viewmodel.dart';

class Body extends StatelessWidget {
  void _onLogin(BuildContext context, LoginViewmodel viewmodel) async {
    final Token _token = await viewmodel.authenticate();
    if (_token == null) {
      Navigator.pop(context, 'error');
    }
    final User _user = _token.user;

    if (_user != null) Navigator.pop(context, _token);
  }

  void _onCancel(BuildContext context, LoginViewmodel viewmodel) {
    viewmodel.showErrorMessage = false;
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: LoginViewmodel(),
      builder: (context, viewmodel, _) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextField(
              hint: 'Username',
              icon: Icons.people,
              onChanged: (value) => viewmodel.username = value),
          _buildTextField(
              hint: 'Password',
              isObsecure: !viewmodel.showPassword,
              icon: Icons.lock,
              button: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () =>
                      viewmodel.showPassword = !viewmodel.showPassword),
              onChanged: (value) => viewmodel.password = value),
          if (viewmodel.showErrorMessage)
            Text(
              'Invalid username or password!',
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            ),
          SizedBox(height: 10.0),
          _buildButtons(context, viewmodel)
        ],
      ),
    );
  }

  TextField _buildTextField(
      {hint, icon, isObsecure = false, button, onChanged}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon) : null,
        suffixIcon: button,
      ),
      obscureText: isObsecure,
      onChanged: onChanged,
    );
  }

  Column _buildButtons(BuildContext context, LoginViewmodel viewmodel) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Log in'),
              onPressed: () => _onLogin(context, viewmodel),
            ),
            SizedBox(width: 10.0),
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () => _onCancel(context, viewmodel),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20.0),
            Text(''),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20.0),
            Text(''),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20.0),
            ElevatedButton(
                child: Text('Register'),
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/Register')),
          ],
        ),
      ],
    );
  }
}
