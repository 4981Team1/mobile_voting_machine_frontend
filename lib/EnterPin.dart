import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import './models/poll.dart';
import 'ConnectionManager.dart';
import 'AvailablePolls.dart';
import 'dart:convert';
import 'main.dart';

final connectionManager = ConnectionManager.getInstance();
class EnterPin extends StatelessWidget {
  TextEditingController pinController = TextEditingController();
  // final items = Student.getStudents();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            title: Text("Welcome!")),
        backgroundColor: Colors.grey[800],
        body: Center(
            child:Column(
                children: <Widget>[
                  SizedBox(
                    height: 200,
                  ),
                  Text('Enter Pin', style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  TextField(
                    controller: pinController,
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
                    onPressed: () async {
                      print("Connected Device: " + connectionManager.getDevice().toString());
                      print("Connected Service: " + connectionManager.getService().toString());
                      print("textfield text: " + pinController.text);
                      List<int> hex = [];
                      for (BluetoothCharacteristic characteristic in connectionManager.getService().characteristics) {
                        if (characteristic.uuid == new Guid('01010101-0101-0101-0101-010101524742')) {
                          await characteristic.setNotifyValue(true);
                          characteristic.value.listen((value) {
                            hex+=value;
                            String stringValue = new String.fromCharCodes(hex);
                            print("NOTIFY: ${stringValue}");
                            if(value.length == 1) {
                              hex.removeLast();
                              print("yes");
                              String stringValue = new String.fromCharCodes(hex);
                              print("NOTIFY: " + stringValue);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AvailablePolls(jsonStr: stringValue)),
                              );
                            }
                          });
                          characteristic.write(utf8.encode(pinController.text));
                        }
                      }

                    },
                    color: Colors.white,
                    child: const Text('Submit', style: TextStyle(fontSize: 20)),

                  ),
                ]
            )));
  }
}