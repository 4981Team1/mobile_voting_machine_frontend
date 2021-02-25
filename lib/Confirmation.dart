import 'package:Voting_Machine/AvailablePolls.dart';
import 'package:flutter/material.dart';
import 'ConnectionManager.dart';
import 'EnterPin.dart';
import 'VotingEvent.dart';

final connectionManager = ConnectionManager.getInstance();

class Confirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          title: Text("Welcome!")
      ),
      backgroundColor: Colors.black,
      body: Center(
          child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                Text(
                  'You have selected Candidate #2 and please confirm this.', style: TextStyle(
                  color: Colors.white,
                ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VotingEvent()),
                    );

                  },
                  color: Colors.white,
                  child: const Text('Back', style: TextStyle(fontSize: 20)),

                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AvailablePolls()),
                    );

                  },
                  color: Colors.white,
                  child: const Text('Confirm', style: TextStyle(fontSize: 20)),

                ),
              ]
          )
      ),
    );
  }
}