import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_direct_call/flutter_direct_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Example'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          PermissionStatus status = await Permission.phone.request();
          if (status.isGranted) {
            FlutterDirectCall.makeDirectCall("7021xxxxxx");
          } else {
            print("Permission denied");
          }
        }),
      ),
    );
  }
}
