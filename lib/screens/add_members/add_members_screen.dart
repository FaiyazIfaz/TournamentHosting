import 'package:flutter/material.dart';
import 'widgets/body.dart';
import 'widgets/bar.dart';

class AddMembersScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => AddMembersScreen());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(),
          body: Body(),
        ),
      ),
    );
  }
}
