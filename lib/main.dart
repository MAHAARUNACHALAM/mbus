import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:mbus/components/appbar.dart';
import 'package:mbus/screens/client/busListScreen.dart';
import 'package:mbus/screens/client/passengerDetails.dart';
import 'package:mbus/screens/client/paymentSuccess.dart';
import 'package:mbus/screens/client/seatSelection.dart';
import 'package:mbus/screens/dashboard.dart';
import 'package:mbus/screens/login.dart';
import 'package:mbus/screens/prelogin.dart';
import 'package:mbus/screens/signup.dart';
import 'package:mbus/screens/splashscreen.dart';
import 'config/app_config.dart';
import 'firebase_options.dart';
import 'providers/hexColor.dart';
import 'screens/admin/admindashboard.dart';
import 'screens/superAdmin/superAdminDashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var configuredApp = AppConfig(
    appName: 'mBus',
    flavorName: 'dev',
    apiBaseUrl: 'http://192.168.1.8:5051/',
    child: MaterialApp(
      home: Splashscreen(),
      initialRoute: '/',
      routes: {
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/prelogin': (context) => PreLogin(),
        '/dashboard': (context) => Dashboard(),
        '/seatSelection': (context) => SeatSelectionScreen(),
        '/passenger': (context) => PassengerDetailsScreen(),
        '/admin': (context) => AdminDashboard(),
        '/superadmin': (context) => SuperAdminDashboard(),
        '/success': (context) => PaymentSuccessPage()
      },
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
