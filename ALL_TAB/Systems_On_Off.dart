import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'Outdoor_photos_gallery.dart';
import 'gallery_tab.dart';
class gallery_tab_screen extends StatefulWidget {
  const gallery_tab_screen({super.key});

  @override
  State<gallery_tab_screen> createState() => _gallery_tab_screenState();
}

class _gallery_tab_screenState extends State<gallery_tab_screen> {

  @override
  void initState() {
    super.initState();
    // _getImageUrl();
  }
  // late String _imageUrl3='indoorGallery/person.jpgSun Jun 16 14:08:03 2024.jpg';
  // Future<void> _getImageUrl() async {
  //   // Initialize Firebase if not already initialized
  //   await Firebase.initializeApp();
  //
  //   // Reference to your image in Firebase Storage
  //   Reference storageref = FirebaseStorage.instance.ref().child('indoorGallery/person.jpgSun Jun 16 14:08:03 2024.jpg');
  //
  //   // Get the download URL
  //   String url3 = await storageref.getDownloadURL();
  //
  //   // Set the image URL
  //   setState(() {
  //     _imageUrl3 = url3;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Gallery',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 5,top: 5),
            // child: ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blueGrey,
            //   ),
            //   onPressed: (){
            //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ImageListScreen()));
            //   },
            //   child: Text("Indoor Camera Photos",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
            // ),
            child: Material(color: Colors.blueGrey,borderRadius: BorderRadius.circular(28),clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageListScreen() ));
                },
                splashColor: Colors.black26,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(image: AssetImage("assets/image/onboard/indoor-gallery.png"),
                    // NetworkImage('https://firebasestorage.googleapis.com/v0/b/test1-6115e.appspot.com/o/outdoorGallery%2Fperson.jpgSun%20Jun%2016%2013%3A43%3A58%202024?alt=media&token=64c1968c-a6eb-4a27-9d88-49d5189e24fa'),
                      height: 400,
                      width: 500,
                      fit: BoxFit.cover,
                      // child: Center(child: Text("Indoor Camera Photos",style: TextStyle(fontSize: 21,color: Colors.white),)),
                    ),
                    SizedBox(height: 6,),
                    Text('Indoor Camera photos',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),)
                  ],
                ),

              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.only(left: 5,top: 5),
            // child: ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blueGrey,
            //   ),
            //   onPressed: (){
            //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ImageListScreen()));
            //   },
            //   child: Text("Indoor Camera Photos",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
            // ),
            child: Material(color: Colors.blueGrey,borderRadius: BorderRadius.circular(28),clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageListScreen1()));
                },
                splashColor: Colors.black26,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Ink.image(image:AssetImage("assets/image/onboard/outdoor-gallery.png"),
                    // NetworkImage('https://firebasestorage.googleapis.com/v0/b/test1-6115e.appspot.com/o/outdoorGallery%2Fperson.jpgSun%20Jun%2016%2013%3A43%3A58%202024?alt=media&token=64c1968c-a6eb-4a27-9d88-49d5189e24fa'),
                      height: 400,
                      width: 500,
                      fit: BoxFit.cover,
                      // child: Center(child: Text("Indoor Camera Photos",style: TextStyle(fontSize: 21,color: Colors.white),)),
                    ),
                    SizedBox(height: 6,),
                    Text('Outdoor Camera photos',style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),)
                  ],
                ),

              ),
            ),
          ),
          // Container(
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.blueGrey,
          //     ),
          //     onPressed: (){
          //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ImageListScreen1()));
          //     },
          //     child: Text("Outdoor Camera Photos",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
          //   ),
          // ),
        ],
      ),
    );
  }
}
