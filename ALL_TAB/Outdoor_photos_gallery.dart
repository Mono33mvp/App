// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Downloader',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ImageDownloadPage(),
//     );
//   }
// }
//
// class ImageData {
//   final File file;
//   final DateTime date;
//
//   ImageData({required this.file, required this.date});
// }
//
// class ImageDownloadPage extends StatefulWidget {
//   @override
//   _ImageDownloadPageState createState() => _ImageDownloadPageState();
// }
//
// class _ImageDownloadPageState extends State<ImageDownloadPage> {
//   List<ImageData> _imagesData = [];
//
//   Future<void> _downloadAndSaveImages() async {
//     final storage = FirebaseStorage.instance;
//     final ListResult result = await storage.ref().child('images').listAll();
//
//     for (final Reference ref in result.items) {
//       final String imageUrl = await ref.getDownloadURL();
//       final response = await http.get(Uri.parse(imageUrl));
//       final documentDirectory = await getApplicationDocumentsDirectory();
//       final file = File('${documentDirectory.path}/${ref.name}');
//       await file.writeAsBytes(response.bodyBytes);
//       final metadata = await ref.getMetadata();
//       final DateTime date = metadata.updated ?? DateTime.now();
//       setState(() {
//         _imagesData.add(ImageData(file: file, date: date));
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Downloader'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 _downloadAndSaveImages().then((_) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Images downloaded')),
//                   );
//                 });
//               },
//               child: const Text('Download Images'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _imagesData.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Image.file(
//                       _imagesData[index].file,
//                       fit: BoxFit.cover,
//                       height: MediaQuery.of(context).size.width,
//                       width: MediaQuery.of(context).size.width,
//                     ),
//                     subtitle: Text('Date: ${_imagesData[index].date.toString()}'),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }








import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

// import '../common/image_details.dart';

class ImageListScreen1 extends StatefulWidget {
  const ImageListScreen1({super.key});

  @override
  State<ImageListScreen1> createState() => _ImageListScreenState();
}


class _ImageListScreenState extends State<ImageListScreen1> {
  String? dateTime;
  List<String> imageUrls =[];

  @override
  void initState(){
    super.initState();
    CircularProgressIndicator();
    _loadImage();

    // getImageDateTime();
  }

  Future<void> _loadImage() async{
    // final Reference storageRef= FirebaseStorage.instance.ref().child('profileImage');
    //
    // //List all items in the StorageRef
    //   final ListResult result=await storageRef.listAll();
    Reference storageref = FirebaseStorage.instance.ref();
    ListResult result = await storageref.child('outdoorGallery').listAll();

    final List<String> urls=[];
    for(final ref in result.items){
      final String url = await ref.getDownloadURL();
      urls.add(url);

      final metadata = await ref.getMetadata();
      final DateTime date = metadata.updated ?? DateTime.now();
    }
    setState(() {
      // imageUrls=result.items.map((item) => item.getDownloadURL()).toList();
      imageUrls=urls;
      // imageUrls.add(ImageData(date: date) as String);
    });


  }
  // Future<void> getImageDateTime() async {
  //   Reference ref = FirebaseStorage.instance.ref().child(widget.);
  //   await ref.getMetadata().then((metadata) {
  //     setState(() {
  //       dateTime = metadata.timeCreated.toString();
  //     });
  //   }).catchError((e) {
  //     print('Error retrieving image metadata: $e');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Outdoor Photos',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),),
      ),
      body:
      GridView.builder(
          itemCount: imageUrls.length,

          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 0.5,
          ),

          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> imagedetail(imageUrl: imageUrls[index],)),
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> ImageDetails(imageUrl:imageUrls[index] ,) ),
                );
              },
              child: Padding(
                  padding: EdgeInsets.all(1),
                  child: imageUrls!=null? Image.network(imageUrls[index],
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  )
                      :Center(
                    child: CircularProgressIndicator(),
                  )
              ),
            );
          }
      ),

      // Container(
      //   child: GridView.builder(
      //       itemCount: imageUrls.length >5 ?  imageUrls.length - 5 : 0,
      //
      //       gridDelegate:
      //       const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 3,
      //         crossAxisSpacing: 4.0,
      //         mainAxisSpacing: 4.0,
      //       ),
      //
      //       itemBuilder: (BuildContext context, int index) {
      //         return GestureDetector(
      //           onTap: (){
      //             Navigator.push(context, MaterialPageRoute(builder: (context)=> imagedetail(imageUrl: imageUrls[index + 5],)),
      //               // Navigator.push(context, MaterialPageRoute(builder: (context)=> ImageDetails(imageUrl:imageUrls[index] ,) ),
      //             );
      //           },
      //           child: Padding(
      //               padding: EdgeInsets.all(10),
      //               child: imageUrls!=null? Image.network(imageUrls[index + 5],
      //                 width: 150,
      //                 height: 150,
      //                 fit: BoxFit.cover,
      //               )
      //                   :Center(
      //                 child: CircularProgressIndicator(),
      //               )
      //           ),
      //         );
      //       }
      //   ),
      // )


    );


  }
}
class imagedetail extends StatelessWidget {
  final String imageUrl;

  imagedetail({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text("Outdoor Photo "),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

