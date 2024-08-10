import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:objectbox_test/home_object_box.dart';
import 'package:objectbox_test/object_box_helper.dart';

late ObjectBoxHelper objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initObjectBox();
  await objectbox.setDeviceId();
  log("Device Id: ${objectbox.getDeviceId()?.deviceId??''}");
  runApp(const ObjectBoxExample());
}

Future<String?> getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id;
  }
  return null;
}

Future<void> initObjectBox() async => objectbox = await ObjectBoxHelper.init();

class ObjectBoxExample extends StatelessWidget {
  const ObjectBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TestObjectBoxHome(),
    );
  }
}
