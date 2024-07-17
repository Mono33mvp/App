//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// import 'package:untitled/ALL_TAB/Video_tab.dart';
//
// import 'package:untitled/pages/notification.dart';
// import 'ALL_TAB/gallery_tab.dart';
// import 'ALL_TAB/User_tab1.dart';
//
// import 'ALL_TAB/profile_tab.dart';
// import 'home_screen.dart';
//
//
// class Navigation_menu extends StatefulWidget {
//   const Navigation_menu ({super.key, String? title});
//
//   @override
//   State<Navigation_menu> createState() => _Navigation_menuState();
// }
//
// class _Navigation_menuState extends State<Navigation_menu> {
//   int currentindex = 0;
//   final screens = [
//     Home_screens(),
//     ImageWithButtonScreen (),
//     // ImageListScreen(),
//     MyHomePage1 (),
//     // MyHomePage1(title: 'hello'),
//     Profilescreen(),
//     // ProfileApp(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.black12,
//       // appBar: AppBar(
//       //   title: Container(
//       //       padding: EdgeInsets.only(left: 20.0,top: 20.0),
//       //       child: Text('Home',style: TextStyle(fontWeight: FontWeight.bold),)),
//       //   actions: [
//       //     IconButton(onPressed: () async{
//       //       await GoogleSignIn().signOut();
//       //       FirebaseAuth.instance.signOut();
//       //     }, icon: const Icon(Icons.power_settings_new))
//       //   ],
//       // ),
//
//       // bottomNavigationBar: NavigationBar(
//       // height: 50,
//       // elevation: 0,
//       //selectedIndex: 0,
//       // onDestinationSelected: (index)=>,
//       // destinations: const [
//       //   NavigationDestination(icon: Icon(Icons.home), label: "Home"),
//       //   NavigationDestination(icon: Icon(Icons.home), label: "Home"),
//       //   NavigationDestination(icon: Icon(Icons.home), label: "Home"),
//       //   NavigationDestination(icon: Icon(Icons.home), label: "Home"),
//       // ],
//
//       // body: screens[currentindex],
//       body:PageView(
//         children: screens,
//         onPageChanged: (index){
//           setState(() {
//             currentindex=index;
//           });
//       },
//       ),
//       bottomNavigationBar:
//       NavigationBarTheme(
//
//         data:
//         NavigationBarThemeData(
//           height: 110,
//           elevation: 20,
//             // backgroundColor: Theme.of(context).colorScheme.background,
//             backgroundColor: Colors.black,
//             labelTextStyle: MaterialStateProperty.all(
//               const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.white),
//             )
//         ),
//         child: NavigationBar(
//
//           // type: BottomNavigationBarType.fixed,
//           destinations: const [
//             NavigationDestination(icon: Icon(Icons.home_outlined,color: Colors.white,),
//               label: 'Home',
//
//
//
//               selectedIcon: Icon(Icons.home,color: Colors.blueAccent,),
//             ),
//             NavigationDestination(icon: Icon(Icons.camera_outlined,color: Colors.white,),
//               label: 'Video',
//               selectedIcon: Icon(Icons.camera,color: Colors.blueAccent,),
//             ),
//             NavigationDestination(icon: Icon(Icons.storage_outlined,color: Colors.white,),
//               selectedIcon: Icon(Icons.storage,color: Colors.blueAccent,),
//               label: 'Gallery',
//             ),
//             NavigationDestination(icon: Icon(Icons.verified_user_outlined,color: Colors.white,),
//               label: 'User',
//
//
//               selectedIcon: Icon(Icons.verified_user,color: Colors.blueAccent,),
//             ),
//           ],
//           selectedIndex: currentindex,
//           onDestinationSelected: (index) =>
//               setState(() {
//                 currentindex = index;
//               }),
//
//
//         ),
//       ),
//     );
//   }
// }