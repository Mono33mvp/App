// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// // import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// import '../pages/Camera_URL.dart';
// //
// //
// //
// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   DatabaseReference _databaseReference =
// //   FirebaseDatabase.instance.reference().child('example');
// //
// //   int _counter = 0;
// //
// //   void _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //     _databaseReference.set(_counter); // Set the value in Firebase Realtime Database
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Flutter Firebase Demo'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Text(
// //               '$_counter',
// //               style: TextStyle(fontSize: 40),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: _incrementCounter,
// //               child: Text('Increment'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
// import 'package:firebase_database/firebase_database.dart';
 import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../pages/Camera_URL.dart';
import '../pages/mywebsite.dart';
import '../pages/mywebsite1.dart';
import '../pages/notify.dart';
import 'gallery_tab1.dart';
import 'indoor_system-off_tab.dart';



// import 'package:url_launcher/url_launcher.dart';







class ImageWithButtonScreen extends StatefulWidget {
  const ImageWithButtonScreen({super.key});

  @override
  State<ImageWithButtonScreen> createState() => _ImageWithButtonScreenState();
}

class _ImageWithButtonScreenState extends State<ImageWithButtonScreen> {

  final Uri websiteUrl = Uri.parse('https://8a48-2409-40e6-f5-3c8a-81a9-fffb-6815-d5ad.ngrok-free.app/mjpeg/1');
  // _launchWebsite() async {
  //
  //   if (await canLaunchUrl(websiteUrl)) {
  //     await launchUrl(websiteUrl);
  //   } else {
  //     throw 'Could not launch $websiteUrl';
  //   }
  // }
  final DatabaseReference _databaseReference =
  FirebaseDatabase.instance.ref("LaserAlert");

  late bool value0= true;
  late bool value1=true;

  bool _nodevalue0= false;
  bool _nodevalue1=false;

  final DatabaseReference _databaseReference20 =
  FirebaseDatabase.instance.ref('OutdoorCamera');
  final DatabaseReference _databaseReference21 =
  FirebaseDatabase.instance.ref('IndoorCamera');


  late String _imageUrl='indoorGallery/person.jpgSun Jun 16 14:08:03 2024';
  late String _imageUrl2='outdoorGallery/person.jpgSun Jun 16 13:43:58 2024';

  @override
  void initState() {
    super.initState();
    // _getImageUrl();
    // _getImageUrl2();


    // Replace "your_node" with the path to your specific node in Firebase Realtime Database
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
    _databaseReference20.onValue.listen(( DatabaseEvent event) {
      dynamic outdoorvalue1 = event.snapshot.value;
      // print(outdoorvalue);
      if (outdoorvalue1 == '1') {
        setState(() {
          _nodevalue0 == '1';
          value0 = true;
        });
      }
      else {
        setState(() {
          _nodevalue0 == '0';
          value0 = false;
        });
      }
    }
    );
    _databaseReference21.onValue.listen(( DatabaseEvent event) {
      dynamic indoorvalue1 = event.snapshot.value;
      // print(outdoorvalue);
      if (indoorvalue1 == '1') {
        setState(() {
          _nodevalue1 == '1';
          value1 = true;
        });
      }
      else {
        setState(() {
          _nodevalue1 == '0';
          value1 = false;
        });
      }
    }
    );

  }
  // Future<void> _getImageUrl() async {
  //   // Initialize Firebase if not already initialized
  //    await Firebase.initializeApp();
  //
  //   // Reference to your image in Firebase Storage
  //   Reference storageref = FirebaseStorage.instance.ref().child('indoorGallery/person.jpgSun Jun 16 14:08:03 2024');
  //
  //   // Get the download URL
  //   String url = await storageref.getDownloadURL();
  //
  //   // Set the image URL
  //   setState(() {
  //     _imageUrl = url;
  //   });
  // }
  // Future<void> _getImageUrl2() async {
  //   // Initialize Firebase if not already initialized
  //   await Firebase.initializeApp();
  //
  //   // Reference to your image in Firebase Storage
  //   Reference storageref1 = FirebaseStorage.instance.ref().child('outdoorGallery/person.jpgSun Jun 16 13:43:58 2024');
  //
  //   // Get the download URL
  //   String url1 = await storageref1.getDownloadURL();
  //
  //   // Set the image URL
  //   setState(() {
  //     _imageUrl2 = url1;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Video',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.5),
            child: Image.asset(
              'assets/image/onboard/indoor.png', // Replace with your image path
              width: 480,
              height: 350,

            ),
          ),
      //   Container(
      //     // padding: EdgeInsets.only(left: 10,right: 10),
      //     margin: EdgeInsets.only(left: 10),
      //   width: 480,
      //   height: 350,
      //   decoration: BoxDecoration(
      //     color: Colors.grey, // Placeholder color while loading
      //     borderRadius: BorderRadius.circular(10),
      //     boxShadow: const [
      //       BoxShadow(
      //         color: Colors.black45,
      //         offset: Offset(5.0,5.0),
      //       )
      //     ],
      //     border: Border.all(
      //       color: Colors.black,
      //       width: 2,
      //
      //     )
      //
      //
      //   ),
      //   child: _imageUrl != null
      //           ? Image.network(
      //                _imageUrl,
      //               // scale: 2.0,
      //               // height: MediaQuery.of(context).size.width ,
      //               // width: MediaQuery.of(context).size.width,
      //               fit: BoxFit.cover,
      //               // placeholder: (context, url) => Center(
      //               //   child: CircularProgressIndicator(),
      //               // ),
      //               // errorWidget: (context, url, error) => Icon(Icons.error),
      //       )
      //           : const Center(
      //               child: CircularProgressIndicator(),
      //       ),
      // ),
          // SizedBox(height: 20),
          Container(
            width: 480,
            height: 50,
            margin: EdgeInsets.only(left: 15),
            // padding: EdgeInsets.all(40),
            child: ElevatedButton(
              onPressed: () {
                // VideoDemo();
                // cameraScreen ();
                //   MyWebsite();
                //launchUrl(websiteUrl,mode: LaunchMode.inAppWebView);
                //_launchWebsite();
                //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>_launchWebsite()));
                // Action when the button is pressed
                value0? Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const MyWebsite())): Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Outdoor_system_off()));
              },
              style: ElevatedButton.styleFrom(shadowColor: Colors.black,elevation: 8,
                // side: BorderSide(color: Colors.white,),
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))),
                backgroundColor: Colors.blueGrey,

              ),
              child: const Text('Watch Outdoor Camera'
                  '',style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/image/onboard/outdoor.png', // Replace with your image path
              // width: MediaQuery.of(context).size.width,
              width:480,
              height: 350,
            ),
          ),

          // const SizedBox(height: 70),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            //   Container(
            //   margin: EdgeInsets.only(left: 10),
            //   // padding: EdgeInsets.only(left: 10,right: 10),
            //   width: 480,
            //   height: 350,
            //   decoration: BoxDecoration(
            //       color: Colors.grey, // Placeholder color while loading
            //       borderRadius: BorderRadius.circular(10),
            //       boxShadow: const [
            //         BoxShadow(
            //           color: Colors.black45,
            //           offset: Offset(5.0,5.0),
            //         )
            //       ],
            //       border: Border.all(
            //         color: Colors.black,
            //         width: 2,
            //
            //       )
            //
            //
            //   ),
            //   child: _imageUrl2 != null
            //       ? Image.network(
            //     _imageUrl2,
            //     // scale: 2.0,
            //     // height: MediaQuery.of(context).size.width ,
            //     // width: MediaQuery.of(context).size.width,
            //     fit: BoxFit.cover,
            //     // placeholder: (context, url) => Center(
            //     //   child: CircularProgressIndicator(),
            //     // ),
            //     // errorWidget: (context, url, error) => Icon(Icons.error),
            //   )
            //       : const Center(
            //     child: CircularProgressIndicator(),
            //   ),
            // ),
              // SizedBox(height: 20),
              Container(
                width: 480,
                height: 50,
                margin: EdgeInsets.only(left: 10),
                // padding: EdgeInsets.all(40),
                child: ElevatedButton(
                  onPressed: () {
                    // VideoDemo();
                    // cameraScreen ();
                    //   MyWebsite();
                    //launchUrl(websiteUrl,mode: LaunchMode.inAppWebView);
                    //_launchWebsite();
                    //Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>_launchWebsite()));
                    // Action when the button is pressed
                    value1? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWebsite1())):Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Indoor_system_off()));
                  },
                  style: ElevatedButton.styleFrom(shadowColor: Colors.black,elevation: 8,
                    // side: BorderSide(color: Colors.white,),
                    shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1.0))),
                    backgroundColor: Colors.blueGrey,

                  ),
                  child: const Text('Watch Indoor Camera',style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              ),
    ]
          ),

        ],
      ),
    );
  }
}

//
// class LiveStreamView extends StatelessWidget {
//   final String url;
//
//   LiveStreamView({required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Live Stream'),
//       ),
//       body: InAppWebView(
//         initialUrlRequest: URLRequest(url: WebUri(url)),
//           if (await canLaunchUrl(websiteUrl)) {
//       await launchUrl(websiteUrl);
//     } else {
//     throw 'Could not launch $websiteUrl';
//     }
//
//
//           ),
//         );
//
//
//   }
// }
//
// importing dependencies

//
// // function to trigger the build process
// void main() => runApp(const MyApp());
//
// _launchURLBrowser() async {
//   var url = Uri.parse("https://www.geeksforgeeks.org/");
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

// _launchURLApp() async {
//   var url = Uri.parse("https://www.geeksforgeeks.org/");
//   if (await canLaunchUrl(url)) {
//     await launchUrl(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
//
// /*class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);*/
// //
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Geeks for Geeks'),
//           backgroundColor: Colors.green,
//         ),
//         body: SafeArea(
//           child: Center(
//             child: Column(
//               children: [
//                 Container(
//                   height: 250.0,
//                 ),
//                 const Text(
//                   'Welcome to GFG!',
//                   style: TextStyle(
//                     fontSize: 30.0,
//                     color: Colors.green,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 // Container(
//                 //   height: 20.0,
//                 // ),
//                 // ElevatedButton(
//                 //   onPressed: _launchURLBrowser,
//                 //   style: ButtonStyle(
//                 //     padding:
//                 //     MaterialStateProperty.all(const EdgeInsets.all(5.0)),
//                 //     textStyle: MaterialStateProperty.all(
//                 //       const TextStyle(color: Colors.black),
//                 //     ),
//                 //   ),
//                 //   // textColor: Colors.black,
//                 //   // padding: const EdgeInsets.all(5.0),
//                 //   child: const Text('Open in Browser'),
//                 // ),
//                 Container(
//                   height: 20.0,
//                 ),
//                 ElevatedButton(
//                   onPressed: _launchURLApp,
//                   style: ButtonStyle(
//                       padding:
//                       MaterialStateProperty.all(const EdgeInsets.all(5)),
//                       textStyle: MaterialStateProperty.all(
//                           const TextStyle(color: Colors.black))),
//                   // textColor: Colors.black,
//                   // padding: const EdgeInsets.all(5.0),
//                   child: const Text('Open in App'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
