import '../../create_team/create_team_screen.dart';
import 'package:flutter/material.dart';
import '../manage_options_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/updateTeam');
                },
                child: Text(
                  "Manage Details",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/memberList");
                },
                child: Text(
                  "Manage Members",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
