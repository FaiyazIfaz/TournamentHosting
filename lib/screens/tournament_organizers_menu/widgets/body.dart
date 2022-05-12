import '../../create_tournament/create_tournament_screen.dart';
import 'package:flutter/material.dart';
import '../tournament_organizer_screen.dart';


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

                SizedBox(height: 60),

                SizedBox(
                  width: double.maxFinite,
                  
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(builder: (context) => new CreateTournamentScreen()));
                    },
                    child: Text(
                      "Create a Tournament",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(
                          vertical: 60.0,
                        ),
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 120),

                SizedBox(
                  width: double.maxFinite,
                  
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tournamentList');
                    },
                    child: Text(
                      "Manage Tournament",
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(
                          vertical: 60.0,
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