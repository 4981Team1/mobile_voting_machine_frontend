import 'dart:convert';

import 'package:Voting_Machine/AvailablePolls.dart';
import 'package:flutter/material.dart';
import 'ConnectionManager.dart';
import './models/choices.dart';
import 'dart:convert';
import 'EnterPin.dart';
import 'main.dart';
import 'Confirmation.dart';

final connectionManager = ConnectionManager.getInstance();
List<String> keyList = [];
int _site1 = 0;
String electionId;

/// This Widget is the main application widget.
class VotingEvent extends StatelessWidget {
  static const String _title = 'Example';
  String jsonStr;
  VotingEvent({Key key, this.jsonStr}) : super(key: key) {
    print("in voting event : " + jsonStr);
    Map<String, dynamic> jsonObj = jsonDecode(jsonStr);
    electionId = jsonObj['_id'];
    print("electionId: " + electionId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            title: Text("Welcome!")),
        backgroundColor: Colors.grey[800],
        // appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(jsonStr: jsonStr),
        ),
      ),
    );
  }
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class MyStatefulWidget extends StatefulWidget {
  String jsonStr;
  MyStatefulWidget({Key key, this.jsonStr}) : super(key: key);

  @override
  _GenerateVoteList createState() => _GenerateVoteList(json: jsonStr);
}

BestTutorSite _site = BestTutorSite.javatpoint;

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Widget build(BuildContext context) {
    // String json = '{"choices":{"a":0,"b":1}}';
    // generateList(json);

    return Column(
      children: <Widget>[
        ListTile(
          title: const Text(
            'www.javatpoint.com',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: Radio(
            activeColor: Colors.green,
            value: BestTutorSite.javatpoint,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            'www.w3school.com',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: Radio(
            activeColor: Colors.green,
            value: BestTutorSite.w3schools,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text(
            'www.tutorialandexample.com',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: Radio(
            activeColor: Colors.green,
            value: BestTutorSite.tutorialandexample,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AvailablePolls()),
            );
          },
          color: Colors.white,
          child: const Text('Back', style: TextStyle(fontSize: 20)),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Confirmation(selected: keyList[_site1], electionId: electionId)),
            );
          },
          color: Colors.white,
          child: const Text('Submit', style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
class _GenerateVoteList extends State<MyStatefulWidget> {
  // BestTutorSite _site = BestTutorSite.javatpoint;
  String json;
  _GenerateVoteList({this.json});

  Widget build(BuildContext context) {
    print("jsonstring in generatevotelist: " + json);
    Map<String, dynamic> jsonMap = jsonDecode(json);
    var choices = Choices.fromJson(jsonMap);
    json = jsonEncode(choices);
    List<Widget> ltList = generateList(json);

    Widget sendBtn = RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Confirmation(selected: keyList[_site1], electionId: electionId)),
        );
      },
      color: Colors.white,
      child: const Text('Submit', style: TextStyle(fontSize: 20)),
    );

    Widget backBtn = RaisedButton(
      onPressed: () {
        Navigator.pop(
          context
        );
      },
      color: Colors.white,
      child: const Text('Back', style: TextStyle(fontSize: 20)),
    );

    List<Widget> wList = [];

    ltList.forEach((element) {
      wList.add(element as Widget);
    });

    wList.add(backBtn);
    wList.add(sendBtn);

    Column colList = Column(children: wList);
    // colList.children.add(backBtn);
    // colList.children.add(sendBtn);
    return colList;
  }

  List<Widget> generateList(json) {
    // receive json data within the ids
    Map<String, dynamic> data = jsonDecode(json);

    List<Widget> list = [];
    int i = 0;
    data['choices'].forEach((key, value) {
      keyList.add(key);
      ListTile lt = ListTile(
        title: Text(
          '$key',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Radio(
          activeColor: Colors.green,
          value: i,
          groupValue: _site1,
          onChanged: (int ret) {
            setState(() {
              _site1 = ret;
            });
          },
        ),
      );
      i++;
      print('$key and $value');
      list.add(lt);
    });

    return list;
  }
}
