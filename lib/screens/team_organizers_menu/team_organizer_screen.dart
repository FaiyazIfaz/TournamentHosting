import 'package:flutter/material.dart';
import 'widgets/bar.dart';
import 'widgets/body.dart';

class TeamOrganizerScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => TeamOrganizerScreen());
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
