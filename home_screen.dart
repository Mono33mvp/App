


// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:untitled/common/add_data.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/notify.dart';
import 'package:untitled/pages/sign_up_page.dart';
import 'package:untitled/widgets/slider_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ALL_TAB/Systems_On_Off.dart';
import 'onboarding/on_boarding.dart';
import 'pages/loginpage.dart';


class Home_screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

        debugShowCheckedModeBanner: false,
      // theme: lightMode,
      // darkTheme: darkMode,

      home: home(),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key, String? title});

  @override
  State<home> createState() => _homeState();
}

 class _homeState extends State<home> {
  bool ispressed2=false;
  bool ispressed1=false;
  bool ispressed3=false;

  late bool value=true;
  late bool value1=true;
  late bool value2=true;
  late bool value3=true;


  bool isswitch= false;// Switch widget

  final MaterialStateProperty<Icon?> thumbicon= MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states){
        if(states.contains(MaterialState.selected)){
          return const Icon(Icons.check);
        }

      },
  );
  final MaterialStateProperty<Icon?> thumbicon1= MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states){
      if(states.contains(MaterialState.selected)){
        return const Icon(Icons.close);
      }

    },
  );


  final DatabaseReference _databaseReference =
  FirebaseDatabase.instance.ref('Laser');//Laser Reference
  final DatabaseReference _databaseReference1 =
  FirebaseDatabase.instance.ref('OutdoorCamera');//Outdoor camera ref
  final DatabaseReference _databaseReference3 =
  FirebaseDatabase.instance.ref('IndoorCamera');//Indoor Camera ref
  final DatabaseReference _databaseReferenceF =
  FirebaseDatabase.instance.ref('Flashlight');

  bool lasercheck = false;
  bool indoorcheck = false;
  bool outdoorcheck=false;
  bool flashcheck=false;

  bool _nodeValue1 = false;
  bool _nodeValue2=false;
  bool _nodeValue3=false;
  bool _nodevalueF=false;
  void turnOnCamera() {
    // _databaseReference.child('1').set({
    //   'Laser' : "1"
   setState(() {
     lasercheck= !lasercheck;
   });
    _databaseReference.set(lasercheck ? "1":"0");
  }

  void Alarm(){
    setState(() {
      indoorcheck= !indoorcheck;
    });
    _databaseReference3.set(indoorcheck? "1":"0");
  }
  //
  void turnoffcamera(){
    setState(() {
      outdoorcheck= !outdoorcheck;
    });
    _databaseReference1.set(outdoorcheck? "1":"0");
  }
  void flashlight(){
    setState(() {
      flashcheck=!flashcheck;
    });
    _databaseReferenceF.set(flashcheck? "1":"0");
  }
  final DatabaseReference _databaseReference7 =
  FirebaseDatabase.instance.ref("LaserAlert");
  @override
  void initState() {
    super.initState();
    // _getNodeValue();
    _databaseReference.onValue.listen(( DatabaseEvent event) {
      dynamic nodeValue = event.snapshot.value;
      print(nodeValue);
      if (nodeValue == '1') {
        setState(() {
          _nodeValue1 == '1';
          value = true;
        });
      }
      else {
        setState(() {
          _nodeValue1 == '0';
          value = false;
        });
      }
    }
    );
    _databaseReference3.onValue.listen(( DatabaseEvent event) {
      dynamic indoorvalue = event.snapshot.value;
      print(indoorvalue);
      if (indoorvalue == '1') {
        setState(() {
          _nodeValue2 == '1';
          value1 = true;
        });
      }
      else {
        setState(() {
          _nodeValue2 == '0';
          value1 = false;
        });
      }
    }
    );
    _databaseReference1.onValue.listen(( DatabaseEvent event) {
      dynamic outdoorvalue = event.snapshot.value;
      print(outdoorvalue);
      if (outdoorvalue == '1') {
        setState(() {
          _nodeValue3 == '1';
          value2 = true;
        });
      }
      else {
        setState(() {
          _nodeValue3 == '0';
          value2 = false;
        });
      }
    }
    );_databaseReferenceF.onValue.listen(( DatabaseEvent event) {
      dynamic outdoorvalueF = event.snapshot.value;
      print(outdoorvalueF);
      if (outdoorvalueF == '1') {
        setState(() {
          _nodeValue3 == '1';
          value3 = true;
        });
      }
      else {
        setState(() {
          _nodeValue3 == '0';
          value3= false;
        });
      }
    }
    );
    }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.background,
          backgroundColor: Colors.black87,


         title: const Text('Home', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //     // Navigator.pop(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
        //     //     Navigator.popAndPushNamed(context, "/login");
        //         Navigator.of(context).popAndPushNamed("/login");
        //     // await GoogleSignIn().signOut();
        //     // FirebaseAuth.instance.signOut();
        //   },
        //       icon: const Icon(Icons.power_settings_new,size: 30,color: Colors.white,)
        //
        //   )
        // ],
       ),
      body: SafeArea(

          // width: MediaQuery.of(context).size.width*0.8,
          // height: MediaQuery.of(context).size,
          child:
           Container(

            child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

            Container(
            height: 510,
            // height: MediaQuery.of(context).size.height*0.8,
            child: const SliderScreen(),
            //Container(
            //   height: 40,
            //   color: Colors.grey,
            //   padding: EdgeInsets.all(10.0),
            //   child: const Optionscreen(),
            // )
            ),

            const SizedBox(height: 40,),
            Row(

            children: [
            Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: const EdgeInsets.only(left: 20.0),
             width: 200,// For MOTO
            // width: MediaQuery.of(context).size.width*0.8,


            // color: Colors.teal,
            height: 100,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            //
            // side: BorderSide(color: Colors.white),
            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6)
            )
            ),
            shadowColor: Colors.black,
            elevation: 10,
            backgroundColor: value2 ? Colors.blueAccent : Colors.blueGrey,
            // backgroundColor:Colors.blueGrey,


            ),
            onPressed: (){
            setState(() {
            ispressed2 = !ispressed2;
            });
            turnoffcamera();
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Streamupload()));

            },
            //child: Text(value? 'Outdoor Camera: ON': 'Outdoor Camera: OFF',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18,color: Colors.white),),
            child: Text(value2? 'Outdoor  System: ON':'Outdoor System: OFF ',style: TextStyle(fontWeight: FontWeight.bold,fontSize:18,color: Colors.white),),
            )
            ),
            const SizedBox(width: 10,),
            Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: const EdgeInsets.only(left: 20.0),
            width: 200,
            // color: Colors.teal,
            height: 100,
            child: FilledButton(
            style: ElevatedButton.styleFrom(
            //   side: BorderSide(color: Colors.white,width: 4),
            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            elevation: 10,
            shadowColor: Colors.black,
            backgroundColor: value ? Colors.blueAccent : Colors.blueGrey,
            ),
            onPressed: (){
            setState(() {
            ispressed3 = !ispressed3;
            });
            turnOnCamera();
            },
            child: Text(value? 'Laser Beam: ON': 'Laser Beam: OFF',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),),
            )
            ),
            ],
            ),
            const SizedBox(height: 40,),
            Row(
            children: [

            Container(
            padding: const EdgeInsets.only(left: 20.0),
            margin: const EdgeInsets.only(left: 20.0),
            width: 200,
            // color: Colors.teal,
            height: 100,

            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            // side: BorderSide(color: Colors.white,width: 4),
            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            elevation: 10,
            shadowColor: Colors.black,

            backgroundColor: value1 ? Colors.blueAccent : Colors.blueGrey,
            //  backgroundColor: Colors.blueGrey,

            ),
            onPressed: () {
            //
            setState(() {
            ispressed1 = !ispressed1;
            });
            Alarm();
            // Streamupload1();
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>Streamupload1()));
            },
            //child: Text(indoorcheck? 'Indoor Camera: ON': 'Indoor Camera: OFF',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
            child: Text(value1? 'Indoor System: ON': 'Indoor System: OFF',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
            )
            // Text('Hello',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)

            ),
            const SizedBox(width: 10,),
            Container(
            padding: EdgeInsets.only(left: 20.0),
            margin: EdgeInsets.only(left: 20.0),
            width: 200,
            // color: Colors.teal,
            height: 100,
            child:ElevatedButton(
            style: ElevatedButton.styleFrom(
            // side: BorderSide(color: Colors.white,width: 4),
            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            elevation: 10,
            shadowColor: Colors.black,
            backgroundColor: Colors.blueGrey),
            onPressed:() async{
            final Uri url =Uri(
            scheme: 'tel',
            path: "+112",
            );
            if(await canLaunchUrl(url)){
            await launchUrl(url);
            }
            else {
            print("cant lauch url");
            }

            },
            // await FlutterPhoneDirectCaller.callNumber(number);

            // Navigator.push(context, route)

            child:const Text('Call Police',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.white),
            )

            ),
            ),

            ],// Row children
            ),
            SizedBox(height: 20,),
            Row(
            children: [
            Container(
            margin:const EdgeInsets.only(left: 50
            ),
            child: const Text('Flashlight',style: TextStyle(fontSize: 20,color: Colors.white),),
            ),
            // Container(
            //   margin: EdgeInsets.only(left: 20),
            //   child: Switch(
            //     value: isswitch,
            //
            //     thumbIcon: value3? thumbicon: thumbicon1,
            //     activeColor: Colors.blueAccent,
            //     inactiveThumbColor: Colors.red,
            //     onChanged: (value){
            //       setState(() {
            //         isswitch = !isswitch;
            //         // flashcheck=!flashcheck;
            //         print('1');
            //       });
            //       flashlight();
            //     },
            //
            //   ),
            // ),
            Container(
            padding: EdgeInsets.only(left: 20.0),
            margin: EdgeInsets.only(left: 170.0),
            width: 100,
            // color: Colors.teal,
            height: 50,
            child: FilledButton(
            style: ElevatedButton.styleFrom(
            //   side: BorderSide(color: Colors.white,width: 4),
            shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))
            ),
            elevation: 10,
            shadowColor: Colors.black,
            backgroundColor: value3 ? Colors.blueAccent : Colors.blueGrey,
            ),
            onPressed: (){
            // setState(() {
            //   ispressed3 = !ispressed3;
            // });
            flashlight();
            },
            child: Text(value3? 'ON': 'OFF',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            )
            ),
            ],
            )

            ], //column children
            ),
          )

      ),
      );

    // );

  }
}


// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }
// _callNumber() async{
//   const number = '+100'; //set the number here
//   bool? res = await FlutterPhoneDirectCaller.callNumber(number);
// }

// Widget content(BuildContext context){
//   return Container(
//
//     // padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
//     // margin: EdgeInsets.only(left: 10.0),
//     child: CarouselSlider(items: [1,2,3,4,5].map((i) {
//       return Container(
//
//         width: MediaQuery.of(context).size.width,
//         margin: EdgeInsets.symmetric(horizontal: 5),
//         decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(20)),
//         child: Center(child: Text('text $i')),
//       );
//     }).toList(),
//       options: CarouselOptions(
//           height: 300),
//     )
//   );
// }


