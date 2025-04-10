// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_management/features/presentation/pages/authenticaton/login_screen.dart';
import 'package:task_management/features/presentation/pages/onboarding_screen/screen1.dart';
import 'package:task_management/features/presentation/pages/onboarding_screen/screen2.dart';
import 'package:task_management/features/presentation/pages/onboarding_screen/screen3.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<IntroScreen> {

PageController _controller=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
        children:const [
          FirstScreen(),
          Seconscreen(),
          ThirdScreen()
        ],
      ),
      Container(
        alignment:const Alignment(0, 0.85),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            }, child:const Text('Skip',style: TextStyle(color: Colors.black,fontSize: 18),)),
            SmoothPageIndicator(controller: _controller, count: 3),
          CircleAvatar(
  backgroundColor: const Color.fromARGB(255, 255, 153, 0),
  child: IconButton(
    icon: Icon(Icons.arrow_right, color: Colors.white),
    onPressed: () {
      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    },
  ),
)

          ],
        ))
        ],
      )
    
    );
  }
}
