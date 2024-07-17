import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../navigation_screen.dart';
import '../onboarding/on_boarding.dart';
import '../widgets/Navigation_bar.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();

}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();

  }
  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 1000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Navigation_screen1()));

  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.lock, color: Colors.black,size: 40,),
            SizedBox(width: 5,),
            Text('HSMS',style: TextStyle(fontSize: 40,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
