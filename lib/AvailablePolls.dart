import 'package:flutter/material.dart';
import './models/poll.dart';
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
Future<List<Poll>> fetchPoll(String jsonString) async {

  if(jsonString.isNotEmpty){
    var data = json.decode(jsonString);
    log("data:  $data");

    // If the call to the server was successful, parse the JSON.
    return (data as List).map((p) => Poll.fromJson(p)).toList();
  }
}


// This class contains the available polls and associated styles
class AvailablePolls extends StatelessWidget {
  String jsonStr;
  Future<List<Poll>> poll;
  AvailablePolls({Key key, this.jsonStr}) : super(key: key) {
    poll = fetchPoll(jsonStr);
  }

  // widget containing styles
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          title: Text("Available Polls")),
      backgroundColor: Colors.grey[800],
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
                                        // Go to voting event page
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => VotingEvent(jsonStr: jsonEncode(item))),
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
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EnterPin()
                        ),
                        ModalRoute.withName("/home")
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
