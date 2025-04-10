import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

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
                  width: double.infinity,
                  image: NetworkImage(
                    
                    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ06bReDL4m7VCc2aSKN3bAeO7ywEpqmzxLYMA4OEXUCNE_HasW',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '📌 Stay Organized & Focused',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Easily create, manage, and prioritize your \ntasks to take control of your day.',
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