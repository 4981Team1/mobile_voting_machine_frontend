import 'package:flutter_blue/flutter_blue.dart';

// This is a helper class of connected devices
class ConnectionManager {
  static BluetoothDevice connectedDevice;
  static BluetoothService connectedService;
  static String loginString;
  static ConnectionManager instance = new ConnectionManager();

  static ConnectionManager getInstance() {
    return instance;
  }

  void setDevice(BluetoothDevice device) {
    connectedDevice = device;
  }

  void setService(BluetoothService service) {
    connectedService = service;
  }

  void setLoginString(String inputLogin) {
    loginString = inputLogin;
  }

  BluetoothDevice getDevice() {
    return connectedDevice;
  }

  BluetoothService getService() {
    return connectedService;
  }

  String getLoginString() {
    return loginString;
  }
}