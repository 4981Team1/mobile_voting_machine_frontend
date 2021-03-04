import 'package:flutter/material.dart';
import 'ConnectionManager.dart';
import 'EnterPin.dart';
import 'VotingEvent.dart';

import 'main.dart';
final connectionManager = ConnectionManager.getInstance();

class AvailablePolls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          title: Text("Welcome!")
      ),
      backgroundColor:  Colors.grey[50],
      body: Center(
          child: Column(
              children: <Widget>[

                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VotingEvent()),
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Text('Voting Event #1'),
                    ),
                  ),
                ),

                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      print('Card tapped.');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VotingEvent()),
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 100,
                      child: Text('Voting Event #2'),
                    ),
                  ),
                ),


                RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EnterPin()),
                    );
                  },

                  child: const Text('Finish', style: TextStyle(fontSize: 20)),

                ),
              ]
          )
      ),
    );
  }
}
