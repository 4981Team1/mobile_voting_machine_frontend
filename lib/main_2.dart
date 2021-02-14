// SOURCE: https://blog.kuzzle.io/communicate-through-ble-using-flutter
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'widgets/bluetoothLists.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '4985Test',
        home: MyHomePage(title: "This is a Bluetooth to Pi Test."));
  }
}

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
  BluetoothDevice connectedDevice;
  BluetoothService connectedService;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _buildView(),
      );

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

  Widget _buildView() {
    return (connectedDevice != null)
        ? _buildConnectedDeviceView()
        : _buildDeviceListView();
  }

  Widget _buildConnectedDeviceView() {
    return Column(
      children: [
        Text(connectedDevice.name),
        Container(
          height: 500,
          child: serviceList(widget.servicesList, _bluetoothConnect),
        ),
      ],
    );
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
          connectedDevice = device;
          print("device connected! "+connectedDevice.toString());
        });
      } catch (e) {
        if (e.code != 'already_connected') throw e;
      } finally {
        await connectedDevice.discoverServices();
        setState(() {
          connectedDevice.services.forEach((List<BluetoothService> services) {
            for (BluetoothService result in services) {
              _addServiceToList(result);
            }
          });
        });
      }
  }
}
