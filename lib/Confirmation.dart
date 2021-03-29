import 'package:Voting_Machine/AvailablePolls.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/material.dart';
import './models/ballot.dart';
import 'dart:convert';
import 'ConnectionManager.dart';
import 'EnterPin.dart';
import 'VotingEvent.dart';

final connectionManager = ConnectionManager.getInstance();
String jsonStr;

// This class contains the confirmation before submitting a vote for someone
class Confirmation extends StatelessWidget {
  String selected;
  String electionId;
  Confirmation({Key key, this.selected, this.electionId}) : super(key: key);

  // This widget contains styles
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          title: Text("Welcome!")
      ),
      backgroundColor: Colors.grey[800],
      body: Center(
          child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                ),
                Text(
                  'You have selected ' + selected + ', please confirm.', style: TextStyle(
                  color: Colors.white,
                ),
                ),
                RaisedButton(
                  onPressed: () {
                    // Go back to voting events page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VotingEvent()),
                    );

                  },
                  color: Colors.white,
                  child: const Text('Back', style: TextStyle(fontSize: 20)),

                ),
                RaisedButton(
                  onPressed: () async {
                    print(electionId);
                    print(selected);
                    //TODO: fix this to use ballot model later
                    jsonStr = "{\"_id\":\""+electionId+"\",\"selected\":\""+selected+"\"}";
                    print(jsonStr);
                    for(BluetoothCharacteristic characteristic in connectionManager.getService().characteristics) {
                      if(characteristic.uuid == new Guid('01010101-0101-0101-0101-010101524745')) {
                        print("writing characteristic: " + jsonStr);
                        await characteristic.write(utf8.encode(jsonStr));
                      }
                    }
                    //Go to available polls page
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