import 'package:flutter/material.dart';


class Bar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("View My Teams"),
      leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){ Navigator.pop(context);}),
      centerTitle: true,
    );
  }
}