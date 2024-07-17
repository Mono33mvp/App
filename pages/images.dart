import 'dart:io';
import 'package:flutter/material.dart';

class DisplayImagesScreen extends StatelessWidget {
  final List<File>? imageFiles;

  DisplayImagesScreen({Key? key, required this.imageFiles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Downloaded Images'),
      ),
      body: ListView.builder(
        itemCount: imageFiles?.length ?? 0,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Image.file(
              imageFiles![index],
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
