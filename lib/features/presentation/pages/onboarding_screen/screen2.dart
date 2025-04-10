import 'package:flutter/material.dart';

class Seconscreen extends StatelessWidget {
  const Seconscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 210,),
                Image(
                  image: NetworkImage(
                    'https://img.freepik.com/premium-vector/freelancer-man-working-computer-home-flat-icon-design-background_147586-53.jpg',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '⏳ Never Miss a Deadline',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Set remainders and due dates to keep track\n of important tasks effortlessly',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),

           
          
          ],
        ),
      ),
    );
  }
}