import 'package:flutter/material.dart';
import 'widgets/bar.dart';
import 'widgets/body.dart';

class ManageOptionsTeamScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => ManageOptionsTeamScreen());
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
