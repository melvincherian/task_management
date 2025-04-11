import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/features/presentation/bloc/authbloc/bloc/authentication_bloc.dart';
import 'package:task_management/features/presentation/bloc/imagebloc/bloc/image_bloc.dart';
import 'package:task_management/features/presentation/pages/authenticaton/login_screen.dart';
import 'package:task_management/features/presentation/pages/profile/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('userLogged', false); 
     ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content:  Text('You have been logged out.'),
      duration:  Duration(seconds: 2),
    ),
  );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

    Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => _showLogoutDialog(context),
        child: const Text(
          'Logout',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () async {
                Navigator.of(context).pop();
                await logout(context);
                context.read<AuthenticationBloc>().add(LogoutRequested());
              },
              child:
                  const Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc,AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationLoggedout) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (Route<dynamic> route) => false,
            );
          }
        },
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Image.network(
                  'https://s3-alpha-sig.figma.com/img/23f1/3069/20d0d5f26e8a87b9402ee03fc9bc993c?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=ccUTzG29ZjBOWAra3L2XwZAhawNUwcJpQKTBqKpoFm2rQaFT8h4FFZTKQvRDt-D4mz-yA0c3XnQuBAYOvVd3eG5ZHIMikWk1ee3i7GNpsxYn09yfLu9m~hr5k4sYaY94Tl5hU-kfxbCGHE-5-2C6a7siRG6g-DpT39~oL727duM0OdBE7VDmEzdxO34mfTRMik-zzcoQrLjNJsda6LN8BwPsxuvLczwh3Ekid6WBrMjR3WKrLu4X6nX0NzJFM5aSSxJeDkMcgb6YSRTeQ05MaHPrO6fwehXk0on7p48CXAiPlB~POHfdv1Ni9rUxNlr4ojvv2tW-w0ZalpovKwl7pw__',
                  width: double.infinity,
                  height: 210,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 70), 
                const Text(
                  'John Doe',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Marketing Manager',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                // Single Edit Profile row here
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                       CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 210, 207),
                        child: GestureDetector(
                          onTap: () {
                            context.read<ImageBloc>().add(PickImageEvent());
                          },
                          child: Icon(Icons.edit, color: const Color.fromARGB(214, 255, 128, 0))),
                                             ),
                      const SizedBox(width: 23),
                      const Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: 19,
                            color: Color.fromARGB(255, 97, 91, 91)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                          },
                          icon: const Icon(Icons.arrow_forward))
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 210, 207),
                        child: Icon(Icons.lock, color:  Color.fromARGB(214, 255, 128, 0)),
                      ),
                      const SizedBox(width: 23),
                      const Text(
                        'Change Password',
                        style: TextStyle(
                            fontSize: 19,
                            color: Color.fromARGB(255, 97, 91, 91)),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            
                          },
                          icon: const Icon(Icons.arrow_forward))
                    ],
                  ),
                  
                ),
                SizedBox(height: 17,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 210, 207),
                        child: Icon(Icons.exit_to_app, color:  Color.fromARGB(214, 255, 128, 0)),
                      ),
                      const SizedBox(width: 12),
                      TextButton(onPressed: (){
                       _showLogoutDialog(context);
                      }, child:const Text('Log Out',style: TextStyle(fontSize: 19, color: Color.fromARGB(255, 97, 91, 91)),))
                      
                    ],
                  ),
                 

                ),
              ],
            ),
            const Positioned(
              top: 155,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAe9NZZk7nUE_anJir2Scf7tsqMHRdEpCbJg&s',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Color.fromARGB(232, 255, 55, 0),
                      child: Icon(Icons.edit, size: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
