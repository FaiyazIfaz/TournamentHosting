import 'package:flutter/material.dart';
import 'widgets/bar.dart';
import 'widgets/body.dart';

class ManageOptionsScreen extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => ManageOptionsScreen());
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
