import 'package:flutter/material.dart';

import 'widgets/body.dart';
import 'widgets/bar.dart';

class UpdateTeamScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => UpdateTeamScreen());

  @override
  UpdateTeamScreenState createState() => UpdateTeamScreenState();
}

class UpdateTeamScreenState extends State<UpdateTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(false),
        child: SafeArea(
            child: Scaffold(
          body: Body(),
          appBar: Bar(),
        )));
  }
}
