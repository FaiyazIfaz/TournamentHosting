import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../view.dart';
import '../manage_account_viewmodel.dart';

class Body extends StatelessWidget {
  void _onManageAccount(
      BuildContext context, ManageAccountViewmodel viewmodel) async {
    final User _user = await viewmodel.updateUser(); // here

    print('$_user');
    if (_user != null) Navigator.pop(context);
  }

  void _onCancel(BuildContext context, ManageAccountViewmodel viewmodel) {
    viewmodel.showErrorMessage = false;
    Navigator.pop(context, null);
  }

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: ManageAccountViewmodel(),
      builder: (context, viewmodel, _) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextField(
              hint: 'New Username',
              icon: Icons.people,
              onChanged: (value) => viewmodel.username = value),
          _buildTextField(
              hint: 'New Email',
              icon: Icons.people,
              onChanged: (value) => viewmodel.email = value),
          _buildTextField(
              hint: 'New Password',
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
              hint: 'Confirm the New Password',
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

  Row _buildButtons(BuildContext context, ManageAccountViewmodel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Update Account'),
          onPressed: () => _onManageAccount(context, viewmodel),
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
