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


  // @override
  // void initState() {
  //   super.initState();
  //   _checkUserLoginStatus();
  // }

// Future<void> _checkUserLoginStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     final userLogged = prefs.getBool('userLogged') ?? false;

//     await Future.delayed(const Duration(seconds: 3)); // splash delay

//     if (mounted) {
//       if (userLogged) {
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (_) => const HomeScreen()));
//       } else {
//         // Navigator.pushReplacement(
//         //     context, MaterialPageRoute(builder: (_) => const IntroScreen()));
//       }
//     }
//   }


  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          children: const [FirstScreen(), Seconscreen(), ThirdScreen()],
        ),
        Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: Colors.orange,
                    dotColor: Colors.grey.shade300,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color.fromARGB(255, 255, 98, 0),
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_arrow_right,
                          color: Colors.white),
                      onPressed: () {
                        if (_controller.page == 2) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>const LoginScreen()));
                        } else {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        }
                      },
                    ),
                  ),
                )
              ],
            ))
      ],
    ));
  }
}
