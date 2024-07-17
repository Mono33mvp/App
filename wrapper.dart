import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/home_screen.dart';
import 'package:untitled/pages/loginpage.dart';
import 'package:untitled/widgets/Navigation_bar.dart';

import 'navigation_screen.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // theme: ThemeData(
      //   primaryColor: Colors.blue,
      // ),

      home: StreamBuilder<User?>(

          stream: FirebaseAuth.instance.authStateChanges(),

          builder: (BuildContext context,AsyncSnapshot snapshot)
          {
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            if(snapshot.connectionState==ConnectionState.active){
              if(snapshot.data==null)
              {
                return const LoginPage();
              }
              else
              {
                return const Navigation_screen1();
              }
            }
            return const Text("No widget to build");
          }
      ),
    );
  }
}
