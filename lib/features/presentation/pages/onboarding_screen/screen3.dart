import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

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
                    'https://img.freepik.com/premium-vector/man-drinking-coffee-living-room_25030-44323.jpg?w=360',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '✅ Boost Productivity',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Break task into steps,track progress,and\n get more done with ease',
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