import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'dart:core';

class MyWebsite1 extends StatefulWidget {
  const MyWebsite1({Key? key}) : super(key: key);

  @override
  State<MyWebsite1> createState() => _MyWebsiteState();
}

class _MyWebsiteState extends State<MyWebsite1> {

  double _progress = 0;
  late InAppWebViewController  inAppWebViewController;
  late  Timer _timer;
//final String imageurl= 'https://2bb4-2409-40e6-fc-bd51-3171-ae85-a295-8ad.ngrok-free.app/cam-mid.jpg';
  @override
  void initState(){
    super.initState();
    Timer.periodic(const Duration(milliseconds: 1500), (Timer t) {
      _refreshWebView();
    }
    );
}

@override
void dispose()
{
  _timer.cancel();
  super.dispose();
}

void _refreshWebView(){
    inAppWebViewController.reload();
}

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                  // url: Uri.parse(imageurl),
                    url: WebUri('https://f363-49-47-144-53.ngrok-free.app/cam-hi.jpg')            ),
                onWebViewCreated: (InAppWebViewController controller){
                  inAppWebViewController = controller;
                },
                // onProgressChanged: (InAppWebViewController controller , int progress){
                //   setState(() {
                //     _progress = progress / 100;
                //   });
                // },
              ),
              // _progress < 1 ? Container(
              //   child: LinearProgressIndicator(
              //     value: _progress,
              //   ),
              // ):SizedBox()
            ],
          ),
        ),
      );
    // );
  }
}




// class MyHomePage extends StatelessWidget {
//   final String websiteUrl = 'https://example.com'; // Replace with your URL
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Open URL in App'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => MyWebView(initialUrl: websiteUrl),
//               ),
//             );
//           },
//           child: Container(
//             width: 200,
//             height: 50,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               border: Border.all(),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Text(
//               'Open URL',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//

