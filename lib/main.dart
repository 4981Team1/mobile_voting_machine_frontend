// SOURCE: https://blog.kuzzle.io/communicate-through-ble-using-flutter
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'widgets/bluetoothLists.dart';
import 'ConnectionManager.dart';
import 'EnterPin.dart';

void main() => runApp(new MyApp());

/**
 * Widgets of main.
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Voting Machine',

        home: MyHomePage(title: "Voting Machine"));
  }
}

// Homepage containing widgets
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final FlutterBlue flutterBlueInstance = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
  final List<BluetoothService> servicesList = new List<BluetoothService>();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ConnectionManager connectionManager = ConnectionManager.getInstance();
  BluetoothDevice connectedDevice;
  BluetoothService connectedService;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
      backgroundColor: Colors.grey[850],
    ),
    body: _buildDeviceListView(),
    backgroundColor: Colors.grey[800],

  );

  // This init state includes scanning for and adding devices using bluetooth
  @override
  void initState() {
    super.initState();
    widget.flutterBlueInstance.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceToList(device);
      }
    });
    widget.flutterBlueInstance.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceToList(result.device);
      }
    });
    widget.flutterBlueInstance.startScan();
  }

  Widget _buildDeviceListView() {
    return deviceList(widget.devicesList, _bluetoothConnect);
  }

  _addDeviceToList(final BluetoothDevice device) {
    if (!widget.devicesList.contains(device)) {
      setState(() {
        widget.devicesList.add(device);
      });
    }
  }

  _addServiceToList(final BluetoothService service) {
    if (!widget.servicesList.contains(service)) {
      setState(() {
        print("service: "+service.toString());
        widget.servicesList.add(service);
      });
    }
  }

  _bluetoothConnect(BluetoothDevice device) async {
    widget.flutterBlueInstance.stopScan();
    try {
      await device.connect();
      setState(() {
        connectionManager.setDevice(device);
        print("device connected! "+connectionManager.getDevice().toString());
      });
    } catch (e) {
      if (e.code != 'already_connected') throw e;
    } finally {
      await connectionManager.getDevice().discoverServices();
      connectionManager.getDevice().services.forEach((List<BluetoothService> services) {
          for(BluetoothService service in services) {
            print("Service information: " + service.toString());
            print("assigned service");
            if(service.uuid == new Guid("00000000-0000-1000-8000-00805f9b34fb")){
              connectionManager.setService(service);
            }
          }
      });
      // Go to the "Enter the Pin" page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EnterPin()),
      );

      }
    }
}

