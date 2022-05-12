import 'package:flutter/material.dart';

import 'widgets/body.dart';
import 'widgets/bar.dart';


class CreateTeamScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => CreateTeamScreen());

  @override
  CreateTeamScreenState createState() => CreateTeamScreenState();
}

class CreateTeamScreenState extends State<CreateTeamScreen> {
    
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