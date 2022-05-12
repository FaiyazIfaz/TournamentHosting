import '../../create_team/create_team_screen.dart';
import 'package:flutter/material.dart';
import '../team_organizer_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(50.0),

        // autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // text

            SizedBox(height: 30),

            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/CreateTeam");
                },
                child: Text(
                  "Create a Team",
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
                  Navigator.pushNamed(context, '/ViewMyTeams');
                },
                child: Text(
                  "View My Teams",
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
                  Navigator.pushNamed(context, '/FindTournament');
                },
                child: Text(
                  "Find Tournament",
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
                  Navigator.pushNamed(context, '/FindTeam');
                },
                child: Text(
                  "Find Team",
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
          ],
        ),
      ),
    );
  }
}
