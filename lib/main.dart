import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:mbus/components/appbar.dart';
import 'package:mbus/screens/splashscreen.dart';
import 'config/app_config.dart';
import 'providers/hexColor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var configuredApp = AppConfig(
    appName: 'mBus',
    flavorName: 'dev',
    apiBaseUrl: 'http://192.168.73.49:5226/',
    child: MaterialApp(
      home: Splashscreen(),
    ),
  );

  runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mBus',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(),
      //body to create one buttom to call the api
      body: ElevatedButton(
        onPressed: () async {
          //call the api
          var response =
              await Dio().get('http://192.168.73.49:5226/api/User/test');
          //print the response
          print(response);
        },
        child: const Text("Call API"),
      ),
    );
  }
}
