

// import 'dart:js' show context;



import 'package:flutter/material.dart';
import 'package:untitled/onboarding/on_boarding_items.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../pages/sign_up_page.dart';
import '../wrapper.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = OnBoardingItems();
  final pageController = PageController();
  bool isLastPage= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Container(
            // margin: EdgeInsets.only(top: 1020),
            color: Colors.blue[300],
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
            // padding: EdgeInsets.symmetric(horizontal: 40),
            child:isLastPage? const getstarted():
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [
                  //Skip button
                       TextButton(onPressed: ()=>pageController.jumpToPage(controller.items.length-1),
                      child: const Text("SKIP",style: TextStyle(fontSize: 20),)),

                  //Indicator button
                      SmoothPageIndicator(controller: pageController,
                    count: controller.items.length,
                    onDotClicked: (index)=>pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 400), curve: Curves.easeIn),
                    effect: const WormEffect(
                      activeDotColor: Colors.purple,

                      dotHeight: 15,
                      dotWidth: 15,
                    ),),
                  //Next button
                  TextButton(onPressed: ()=>pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn),
                      child: const Text("NEXT",style: TextStyle(fontSize: 20),)),
                ],
              ),
        ),
             body:   Container(
                  // height: 1300,
          margin: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: PageView.builder(
              onPageChanged: (index)=>setState(() =>isLastPage=controller.items.length-1==index),
              itemCount: controller.items.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage('assets/image/onboard/slide-1.png'),
                      //     // Image.asset(controller.items[index].image,
                      //      fit: BoxFit.cover,
                      //
                      //   )
                      // ),

                      height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(controller.items[index].image,
                          height: 1200,
                        ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: Text(controller.items[index].title,
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),),
                    ),
                    const SizedBox(height: 15),
                    Text(controller.items[index].descriptions,
                      style: const TextStyle(fontSize: 18, color: Colors.blueAccent),
                      textAlign: TextAlign.center,),
                  ],
                );
              }),
        )
    );
  }
}
class getstarted extends StatelessWidget {
  const getstarted({super.key});

  bool get mounted => true;



  @override
  Widget build(BuildContext context) {
    return Container(


      // padding: EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        //
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,

        color: Colors.blue[300],
        //
      ),
      //width:Me,
      // padding: EdgeInsets.only(left: 170.0,right: 170.0),
      // height: 70,
      width: MediaQuery.of(context).size.width * .9,
      // height: 50,
      child:TextButton
        (onPressed: () async{
        final press=await SharedPreferences.getInstance();
        press.setBool("onboarding", true);

        if(!mounted)return;

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>const Wrapper()));
      },


        style: TextButton.styleFrom(shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0))),
        child: const Text("Get Started", style: TextStyle(fontSize: 26),),
      ),
    );





  }
}






//
// mixin context {
//   final route=MaterialPageRoute(
//       builder: (BuildContext context)=>home());
// }
