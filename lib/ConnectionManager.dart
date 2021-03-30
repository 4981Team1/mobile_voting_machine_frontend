import 'package:flutter_blue/flutter_blue.dart';

/**
 * Helper class of connected devices.
 */
class ConnectionManager {
  static BluetoothDevice connectedDevice;
  static BluetoothService connectedService;
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

  BluetoothDevice getDevice() {
    return connectedDevice;
  }

  BluetoothService getService() {
    return connectedService;
  }
}