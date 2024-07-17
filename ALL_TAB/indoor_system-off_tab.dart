import 'package:flutter/material.dart';
class Indoor_system_off extends StatefulWidget {
  const Indoor_system_off({super.key});

  @override
  State<Indoor_system_off> createState() => _Indoor_system_offState();
}

class _Indoor_system_offState extends State<Indoor_system_off> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
    body:const Center(
    child: Text("Indoor unit is Currently turned Off",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
    )
    );
  }
}
