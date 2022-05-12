import 'package:flutter/material.dart';

import '../team_organizer_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("UTM Play"),
      leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            Navigator.pushNamed(context, '/manageAccount');
          }),
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(Icons.logout),
            color: Colors.red,
            onPressed: () {
              Navigator.pop(context, "yes");
            })
      ],
    );
  }
}
