import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blue/flutter_blue.dart';
import '../ConnectionManager.dart';


/*
For a large list, use Listview to construct a list of devices
   This includes the styles too
   */
ListView deviceList(List<BluetoothDevice> devices, Function connect) {
  return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (context, index) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  Text(devices[index].name.isEmpty
                      ? "(unknown device)"
                      : devices[index].name.toString(), style: TextStyle(fontSize: 25, color:Colors.white)),
                  Text(devices[index].id.toString(), style: TextStyle(fontSize: 25, color:Colors.white)),
                  RaisedButton(
                    color: Colors.white,
                    child: Text("Connect", style: TextStyle(fontSize: 20)),
                    onPressed: (){
                      print("connecting");
                      connect(devices[index]);
                    },
                  )
                ],
              ),
            ],
          ),
        );
      });
}
// Some helper functions

class ServiceList extends StatelessWidget{
  ConnectionManager connectionManager = ConnectionManager.getInstance();
  List<BluetoothService> services;

  @override
  Widget build(BuildContext context) {
  connectionManager.getDevice().services.forEach((List<BluetoothService> services) {
     for (BluetoothService result in services) {
       services.add(result);
     }
   });
  return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        print(services[index]);
        return Container(
          child: Row(
            children: <Widget>[
              Column(
                children: [
                  Text(services[index].uuid.toString()),
                  Container(
                    height: 100,
                    width: 300,
                    child:
                    // Row(
                    //   children: [],
                    // )
                    characteristicList(services[index].characteristics),
                  ),
                  FlatButton(
                    color: Colors.blue,
                    child: Text("Connect"),
                    onPressed: (){
                      // connect(services[index]);
                    },
                  )
                ],
              ),
        ]
        ),);});
  }
}

ListView characteristicList(List<BluetoothCharacteristic> characteristics) {
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: characteristics.length,
      itemBuilder: (context, index) {
        print("CHARACTERISTIC: " + characteristics[index].toString());
        return Row(
          children: [
            readButton(characteristics[index]),
            writeButton(characteristics[index])
          ],);


      });
}

TextButton readButton(BluetoothCharacteristic characteristic) {
  return TextButton(
    child: Text("READ"),
    onPressed:() async{
      List<int> value = await characteristic.read();
      print(value);
    },
  );
}

TextButton writeButton(BluetoothCharacteristic characteristic) {
  return TextButton(
    child: Text("WRITE"),
    onPressed: () async{
      await characteristic.write([0x12, 0x34]);
    },
  );
}

TextButton notifyButton(BluetoothCharacteristic characteristic) {
  return TextButton(
    child: Text("NOTIFY"),
    onPressed:() async{
      await characteristic.setNotifyValue(true);
      characteristic.value.listen((value) {

      });
    },
  );
}


