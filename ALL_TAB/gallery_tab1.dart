import 'package:flutter/material.dart';
class Outdoor_system_off extends StatefulWidget {
  const Outdoor_system_off({super.key});

  @override
  State<Outdoor_system_off> createState() => _Outdoor_system_offState();
}

class _Outdoor_system_offState extends State<Outdoor_system_off> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body:const Center(
        child: Text("Outdoor unit is Currently turned Off",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
      )
    );
  }
}
