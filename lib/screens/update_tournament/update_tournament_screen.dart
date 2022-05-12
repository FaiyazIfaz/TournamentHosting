import 'package:flutter/material.dart';

import 'widgets/body.dart';
import 'widgets/bar.dart';

class UpdateTournamentScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => UpdateTournamentScreen());

  @override
  UpdateTournamentScreenState createState() => UpdateTournamentScreenState();
}

class UpdateTournamentScreenState extends State<UpdateTournamentScreen> {
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
