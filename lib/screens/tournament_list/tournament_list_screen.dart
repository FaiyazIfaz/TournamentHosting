import 'package:flutter/material.dart';

import 'widgets/body.dart';
import 'widgets/bar.dart';

class TournamentListScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => TournamentListScreen());

  @override
  TournamentListScreenState createState() => TournamentListScreenState();
}

class TournamentListScreenState extends State<TournamentListScreen> {
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
//demo
