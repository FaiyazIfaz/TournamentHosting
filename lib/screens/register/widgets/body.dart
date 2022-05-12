import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../view.dart';
import '../register_viewmodel.dart';

class Body extends StatelessWidget {
  void _onRegister(BuildContext context, RegisterViewmodel viewmodel) async {
    final User _user = await viewmodel.register();

    print('$_user');
    if (_user != null) Navigator.pop(context, null);
    // Navigator.pushReplacementNamed(context, '/login');
  }

  void _onCancel(BuildContext context, RegisterViewmodel viewmodel) {
    viewmodel.showErrorMessage = false;
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: RegisterViewmodel(),
      builder: (context, viewmodel, _) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextField(
              hint: 'Username',
              icon: Icons.people,
              onChanged: (value) => viewmodel.username = value),
          _buildTextField(
              hint: 'Email',
              icon: Icons.people,
              onChanged: (value) => viewmodel.email = value),
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
          _buildTextField(
              hint: 'Confirm Password',
              isObsecure: !viewmodel.showPassword,
              icon: Icons.lock,
              button: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () =>
                      viewmodel.showPassword = !viewmodel.showPassword),
              onChanged: (value) => viewmodel.confPassword = value),
          if (viewmodel.showErrorMessage)
            Text(
              'Invalid username or password!',
              style: TextStyle(color: Colors.red, fontSize: 20.0),
            ),
          //dsdsdsadsa
          DropdownButton<String>(
            hint: Text("User Type"),
            items: <String>['Player', 'Host'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            value: viewmodel.stringType,
            onChanged: (value) {
              viewmodel.type = value;
              print(
                  '${viewmodel.type} /n ${viewmodel.password}  /n ${viewmodel.password} /n ${viewmodel.username}  /n ${viewmodel.email}');
            },
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

  Row _buildButtons(BuildContext context, RegisterViewmodel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Register'),
          onPressed: () => _onRegister(context, viewmodel),
        ),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => _onCancel(context, viewmodel),
        ),
      ],
    );
  }
}
