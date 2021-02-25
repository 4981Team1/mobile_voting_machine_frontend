
import 'package:Voting_Machine/AvailablePolls.dart';
import 'package:flutter/material.dart';
import 'ConnectionManager.dart';
import 'EnterPin.dart';
import 'main.dart';
import 'Confirmation.dart';

final connectionManager = ConnectionManager.getInstance();
/// This Widget is the main application widget.
class VotingEvent extends StatelessWidget {
  static const String _title = 'Example';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            title: Text("Welcome!")
        ),
        backgroundColor: Colors.black,
        // appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  BestTutorSite _site = BestTutorSite.javatpoint;

  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        ListTile(
          title: const Text('www.javatpoint.com', style: TextStyle(
            color: Colors.white,
          ),),
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
          title: const Text('www.w3school.com', style: TextStyle(
            color: Colors.white,
          ),),
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
          title: const Text('www.tutorialandexample.com', style: TextStyle(
            color: Colors.white,
          ),),
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
              MaterialPageRoute(builder: (context) => Confirmation()),
            );

          },
          color: Colors.white,
          child: const Text('Submit', style: TextStyle(fontSize: 20)),

        ),
      ],
    );
  }
}