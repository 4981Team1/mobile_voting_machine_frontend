import 'package:flutter/material.dart';
import 'ConnectionManager.dart';
import 'EnterPin.dart';
import 'VotingEvent.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'main.dart';

final connectionManager = ConnectionManager.getInstance();

/**
 * Converting json string to Poll object
 */
Future<List<Poll>> fetchPoll() async {

  String jsonString = '[{"_id":"1111","details":"Burnabyy Campus Election"},'
      '{"_id":"2222","details":"Downtown Campus Election"},'
      '{"_id":"3333","details":"CST Electionn"}]';

  var data = json.decode(jsonString);
  log("data:  $data");

  // If the call to the server was successful, parse the JSON.
  return (data as List).map((p) => Poll.fromJson(p)).toList();
}

/**
 * Poll object conversion
 */
class Poll {
  final String id;
  final String details;

  Poll({this.id, this.details});

  factory Poll.fromJson(Map<String, dynamic> json) {
    return Poll(
      id: json['_id'],
      details: json['details'],
    );
  }
}

class AvailablePolls extends StatelessWidget {
  Future<List<Poll>> poll = fetchPoll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          title: Text("Welcome!")),
      backgroundColor: Colors.grey[50],
      body:   new Builder(
          builder: (BuildContext context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  //flex: 8,
                  child: FutureBuilder<List<Poll>>(
                          future: poll,
                          // ignore: missing_return
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  final item = snapshot.data[index];
                                  return Card(
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
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text('Voting Event #' + index.toString()),
                                            Text('Poll id: ' + item.id),
                                            Text('Poll title: ' + item.details),
                                            // ignore: missing_return
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );

                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            else{
                              return Container();
                      }
                    },
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
              ],
            );
          }
      )
    );
  }
}
