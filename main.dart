//main.dart
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/pages/notify.dart';
import 'package:untitled/pages/splash_screen.dart';
import 'package:untitled/widgets/Navigation_bar.dart';
import 'ALL_TAB/Video_tab.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled/pages/sign_up_page.dart';
import 'package:untitled/pages/loginpage.dart';
import 'package:untitled/pages/splashscreen1.dart';
import 'home_screen.dart';
import 'navigation_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'onboarding/on_boarding.dart';Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCpDPxTPbVNSefXPo0QF3PliIaWzw4kXzg",
        appId: "1:969538240205:android:d1d656341298b88e0d7384",
        messagingSenderId: "540215271818",
        projectId: "test1-6115e",
        databaseURL: "test1-6115e-default-rtdb.asia-southeast1.firebasedatabase.app",
        storageBucket: "gs://test1-6115e.appspot.com",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  // );
  AwesomeNotifications().initialize(
      null,
    [
      NotificationChannel(channelKey: 'instant_notifcations', channelName: "basic instant notifcations", channelDescription: "channelDescription",
      defaultColor: Colors.red,
      ledColor: Colors.white,
      ),
    ],
     );AwesomeNotifications().initialize(
      null,
    [
      NotificationChannel(channelKey: 'Outdoor_notifications', channelName: "basic instant notifcations", channelDescription: "channelDescription",
      defaultColor: Colors.red,
      ledColor: Colors.white,
      ),
    ],
     );
  WidgetsFlutterBinding.ensureInitialized();
  final prefs= await SharedPreferences.getInstance();
  final onboarding= prefs.getBool("onboarding")??false;// WidgetsFlutterBinding.ensureInitialized();
  // final storage= await SharedPreferences.getInstance();
  // final  onboarding= storage.getBool("isOnboardingtrue")??false;
  // SystemChrome.setSystemUIOverlayStyle(style);
  runApp(MyApp(onboarding:onboarding));
}

class MyApp extends StatefulWidget {
  final bool onboarding;

  const MyApp({super.key, this.onboarding= false});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DatabaseReference _databaseReference1 =
  FirebaseDatabase.instance.ref("indoorAlert");
  final DatabaseReference _databaseReference =
  FirebaseDatabase.instance.ref("LaserAlert");
  final DatabaseReference _databaseReference2 =
  FirebaseDatabase.instance.ref("outdoorAlert");
  // This widget is the root of your application.
  @override
  void initState(){
    super.initState();
    _databaseReference.onValue.listen(( DatabaseEvent event) {
      // Retrieve the value of the node
      var nodeValue = event.snapshot.value;

      // Check if the node value is 1
      if (nodeValue == "1") {
        // Call the pushNotification function
        print('done');
        Notify.instantNotify();
      }
    }
    );
    _databaseReference1.onValue.listen(( DatabaseEvent event) {
      // Retrieve the value of the node
      var nodeValue1 = event.snapshot.value;

      // Check if the node value is 1
      if (nodeValue1 == "1") {
        // Call the pushNotification function
        print('done');
        Notify.instantNotify1();
      }
    }
    );
    _databaseReference2.onValue.listen(( DatabaseEvent event) {
      // Retrieve the value of the node
      var nodeValue1 = event.snapshot.value;

      // Check if the node value is 1
      if (nodeValue1 == "1") {
        // Call the pushNotification function
        print('done');
        Notify.instantNotify2();
      }
    }
    );

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeData.light();

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      routes: {
        '/login': (context) =>  const LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => Navigation_screen1(),
        '/onboard':(context)=>OnBoardingScreen()},
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: widget.onboarding? const Splash_screen  (): const Splash_screen1(),

    );
  }
}

class Myhomepage extends StatelessWidget {
  const Myhomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          children: [
            home(),
            ImageWithButtonScreen(),
          ],

      ),
    );
  }
}
