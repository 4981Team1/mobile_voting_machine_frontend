import 'package:Voting_Machine/AvailablePolls.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/material.dart';
import './models/ballot.dart';
import 'dart:convert';
import 'ConnectionManager.dart';
import 'EnterPin.dart';
import 'VotingEvent.dart';

final connectionManager = ConnectionManager.getInstance();

class Confirmation extends StatelessWidget {
  String selected;
  String electionId;
  Confirmation({Key key, this.selected, this.electionId}) : super(key: key);
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
                  'You have selected' + selected + 'and please confirm this.', style: TextStyle(
                  color: Colors.white,
                ),
                ),
                RaisedButton(
                  onPressed: () {
                    Map<String, dynamic> json;
                    json['_id'] = electionId;
                    json['selected'] = selected;
                    var ballotObj = Ballot.fromJson(json);
                    String jsonStr = jsonEncode(ballotObj);
                    for(BluetoothCharacteristic characteristic in connectionManager.getService().characteristics) {
                      if(characteristic.uuid == new Guid('01010101-0101-0101-0101-010101524745')) {
                        characteristic.write(utf8.encode(jsonStr));
                      }
                    }
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