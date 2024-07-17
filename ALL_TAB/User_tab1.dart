// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/painting.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //   runApp(ProfileApp());
// // }
// //
// class ProfileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'User Profile',
//       // theme: ThemeData.light(),
//       // darkTheme: ThemeData.dark(),
//       home: ProfileScreen(),
//     );
//   }
// }
//
// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   late TextEditingController nameController;
//   late TextEditingController emailController;
//   late TextEditingController dobController;
//   late TextEditingController bioController;
//
//   File? _image;
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController();
//     emailController = TextEditingController();
//     dobController = TextEditingController();
//     bioController = TextEditingController();
//     _getUserProfile();
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     emailController.dispose();
//     dobController.dispose();
//     bioController.dispose();
//     super.dispose();
//   }
//   bool _isDarkMode = false;
//
//   void _toggleDarkMode() {
//     setState(() {
//       _isDarkMode = !_isDarkMode;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('User Profile',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
//       ),
//       body: SingleChildScrollView(
//
//         // padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 9,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   _buildCoverImage(),
//                   _buildProfileAvatar(),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: 20.0),
//             IconButton(
//               onPressed: () {
//                 _pickImage();
//               },
//               icon: Icon(Icons.camera_alt),
//             ),
//             SizedBox(height: 20.0),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: TextField(
//                 controller: nameController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   labelText: 'Name',
//                   labelStyle: TextStyle(fontSize: 22,color: Colors.blueAccent),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: TextField(
//                 controller: emailController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   labelStyle: TextStyle(fontSize: 22,color: Colors.blueAccent),
//
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: TextField(
//                 controller: dobController,
//                 style: TextStyle(color: Colors.white),
//                 decoration: const InputDecoration(
//                   labelText: 'Date of Birth',
//                   labelStyle: TextStyle(fontSize: 22,color: Colors.blueAccent),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: TextField(
//                 style: TextStyle(color: Colors.white),
//                 controller: bioController,
//                 maxLines: null, // Allow multiline input
//                 decoration: InputDecoration(
//                   labelText: 'Phone no.',
//                   labelStyle: TextStyle(fontSize: 22,color: Colors.blueAccent),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30.0),
//             ElevatedButton(
//               onPressed: () {
//                  saveProfileData();
//
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 elevation: 8,
//                 shadowColor: Colors.black,
//               ),
//               child: Text(
//                 'Save',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             // ElevatedButton(onPressed: _toggleDarkMode, child: Text(_isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode'),),
//
//           ],
//         ),
//       ),
//     );
//
//   }
//
//   Widget _buildCoverImage() {
//     return Container(
//       // width: double.infinity,
//
//       height: 200.0,
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(
//               'assets/image/onboard/hi tech global connection lines background 4k H4RDJ9P.gif'), // Replace with your cover image
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProfileAvatar() {
//     if (_image != null) {
//       return Positioned(
//         top: 100.0,
//         child: CircleAvatar(
//           radius: 50.0,
//           backgroundImage: FileImage(_image!),
//         ),
//       );
//     } else {
//       return const Positioned(
//         top: 100.0,
//         child: CircleAvatar(
//           radius: 50.0,
//           backgroundImage: AssetImage("assets/image/onboard/Profile-Male-PNG.png"),
//           // Placeholder image
//         ),
//       );
//     }
//   }
//
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   Future<void> _getUserProfile() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         DocumentSnapshot userProfile =
//         await _firestore.collection('profiles').doc(user.uid).get();
//         if (userProfile.exists) {
//           Map<String, dynamic> data =
//           userProfile.data() as Map<String, dynamic>;
//           nameController.text = data['name'] ?? '';
//           emailController.text = data['email'] ?? '';
//           dobController.text = data['dob'] ?? '';
//           bioController.text = data['bio'] ?? '';
//           String? imageUrl = data['imageUrl'];
//           if (imageUrl != null && imageUrl.isNotEmpty) {
//             setState(() {
//               _image = null; // Reset _image to prevent overriding it with placeholder
//             });
//             _loadProfileImage(imageUrl);
//           }
//         }
//       } else {
//         throw Exception('User not logged in.');
//       }
//     } catch (e) {
//       print('Error getting user profile: $e');
//     }
//   }
//
//   Future<void> _loadProfileImage(String imageUrl) async {
//     try {
//       var ref = _storage.ref().child(imageUrl);
//       var url = await ref.getDownloadURL();
//       setState(() {
//         _image = File(url);
//       });
//     } catch (e) {
//       print('Error loading profile image: $e');
//     }
//   }
//
//   Future<void> saveProfileData() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         String? imageUrl;
//         if (_image != null) {
//           imageUrl = await _uploadImage(user.uid);
//         }
//         await _firestore.collection('profiles').doc(user.uid).set({
//           'name': nameController.text,
//           'email': emailController.text,
//           'dob': dobController.text,
//           'bio': bioController.text,
//           'imageUrl': imageUrl,
//         });
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Profile data saved successfully!'),
//         ));
//       }
//     } catch (e) {
//       print('Error saving profile data: $e');
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Failed to save profile data. Please try again later.'),
//       ));
//     }
//   }
//
//   Future<String> _uploadImage(String userId) async {
//     try {
//       var ref = _storage.ref().child('profile_images').child('$userId.jpg');
//       await ref.putFile(_image!);
//       return ref.fullPath;
//     } catch (e) {
//       print('Error uploading image: $e');
//       throw Exception('Failed to upload image');
//     }
//   }
// }
//
// // void saveImage(path) async{
// //   SharedPreferences saveimages=await SharedPreferences.getInstance();
// //   saveimages.setString("imagepath", path);
// // }
