import 'package:flutter/material.dart';

import 'widgets/body.dart';
import 'widgets/bar.dart';


class CreateTournamentScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => CreateTournamentScreen());

  @override
  CreateTournamentScreenState createState() => CreateTournamentScreenState();
}

class CreateTournamentScreenState extends State<CreateTournamentScreen> {
    
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          body: Body(),
          appBar: Bar(),
       )
      )
    );
  }
}