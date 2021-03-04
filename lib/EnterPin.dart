import 'package:flutter/material.dart';
import 'ConnectionManager.dart';
import 'AvailablePolls.dart';
import 'main.dart';

final connectionManager = ConnectionManager.getInstance();
class EnterPin extends StatelessWidget {
  // final items = Student.getStudents();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            title: Text("Welcome!")),
        backgroundColor: Colors.grey[50],
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
                      print("Connected Device: " + connectionManager.getDevice().toString());
                      Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => AvailablePolls()),
                      );

                    },
                    color: Colors.white,
                    child: const Text('Submit', style: TextStyle(fontSize: 20)),

                  ),
                ]
            )));
  }
}