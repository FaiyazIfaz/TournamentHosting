import 'package:flutter/material.dart';

import '../create_team_screen.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Create a Team"),
      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){ Navigator.pop(context);}),
      centerTitle: true,
    );
  }
}