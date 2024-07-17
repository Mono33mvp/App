import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/loginpage.dart';

import '../onboarding/on_boarding.dart';
class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController AddController;
  late TextEditingController emailController;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController= TextEditingController();
    AddController=TextEditingController();
    emailController=TextEditingController();
  }
  @override
  void dispose() {
    nameController.dispose();
    AddController.dispose();
    phoneController.dispose();
    emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Profile",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: SafeArea(
        // padding: const EdgeInsets.all(20),
        top: true,

        child: Column(
          children: [
            const SizedBox(height: 100),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/image/onboard/Profile-Male-PNG.png'),
            ),
            SizedBox(height: 80,),
            // TextField(
            //   controller: nameController,
            //   style: TextStyle(color: Colors.white),
            //     decoration: const InputDecoration(
            //       icon: Icon(CupertinoIcons.person),
            //       labelText: 'Name',
            //       labelStyle: TextStyle(fontSize: 22,color: Colors.blueAccent),
            //       border: OutlineInputBorder(),
            // )
            // ),
            // SizedBox(height: 20,),
            // TextField(
            //     controller: phoneController,
            //     style: TextStyle(color: Colors.white),
            //     decoration: const InputDecoration(
            //       icon: Icon(CupertinoIcons.phone,),
            //       labelText: 'Phone no.',
            //       labelStyle: TextStyle(fontSize: 22,color: Colors.blueAccent),
            //       border: OutlineInputBorder(),
            //     )
            // ),
            // SizedBox(height: 20,),
            // TextField(
            //     controller: AddController,
            //     style: TextStyle(color: Colors.white),
            //     decoration: const InputDecoration(
            //       icon: Icon(CupertinoIcons.location),
            //       labelText: 'Address',
            //       labelStyle: TextStyle(fontSize: 22,color: Colors.blueAccent),
            //       border: OutlineInputBorder(),
            //     )
            // ),
            // SizedBox(height: 20,),
            // TextField(
            //     controller: emailController,
            //     style: TextStyle(color: Colors.white),
            //     decoration: const InputDecoration(
            //       icon: Icon(CupertinoIcons.mail),
            //       labelText: 'E-mail',
            //       labelStyle: TextStyle(fontSize: 22,color: Colors.blueAccent),
            //       border: OutlineInputBorder(),
            //     )
            // ),
            // const SizedBox(height: 60),
            itemProfile('Name', 'Monojit sinha', CupertinoIcons.person),

            const SizedBox(height: 20),
            itemProfile('Phone', '9101590242', CupertinoIcons.phone),
            const SizedBox(height: 20),
            itemProfile('Address', 'Brojendra road,Karimganj,Assam', CupertinoIcons.location),
            const SizedBox(height: 20),
            itemProfile('Email', 'Monojitsinha290@gmail.com', CupertinoIcons.mail),
            const SizedBox(height: 20,),

            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //         padding: const EdgeInsets.all(15),
            //       ),
            //       child: const Text('Edit Profile',)
            //   ),
            // )
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
            }, child: Text("Log out"))
          ],
        ),
      ),
    );
  }
//
  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        // trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}