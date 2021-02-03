import 'package:flutter/material.dart';


void main() => runApp(
      MaterialApp(
        home: Home(
        ),
      ),
    );

class Home extends StatelessWidget {



  // final items = Student.getStudents();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            title: Text("Welcome!")),
        backgroundColor: Colors.black,
        body: Center(
        child:Column(
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              Text('Enter Pin', style: TextStyle(color: Colors.white, fontSize: 30),
              ),
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                // border: InputBorder.none,
                labelStyle: TextStyle(color: Colors.red),
                enabledBorder: new UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.green)
                ),
                hintText: 'Enter a search term',
                // labelStyle: new TextStyle(
                //     color: Colors.white,
                // )

            ),
          ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserProfile()),
                  );

                },
                color: Colors.white,
                child: const Text('Submit', style: TextStyle(fontSize: 20)),

              ),
    ]
    )));


  }
}


class UserProfile extends StatelessWidget {
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
              MaterialPageRoute(builder: (context) => Home()),
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
              MaterialPageRoute(builder: (context) => UserProfile()),
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
                      MaterialPageRoute(builder: (context) => UserProfile()),
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