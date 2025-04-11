// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:task_management/features/data/models/repositories/user_data.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _username = '';
  String _email = '';
  // String _imageUrl = '';
  String _phonenumber = '';
  // String _userGoogle = '';

  // late TextEditingController _nameController;
  // late TextEditingController _emailController;
  // late TextEditingController _phoneController;

  // bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // _nameController = TextEditingController();
    // _emailController = TextEditingController();
    // _phoneController = TextEditingController();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
  final prefHelper = SharedPrefHelper();
  final username = await prefHelper.getUserName() ?? 'No username set';
  final email = await prefHelper.getUserEmail() ?? 'No email set';
  // final imageUrl = await prefHelper.getUserImage() ?? 'No image set';
  final phonenumber = await prefHelper.getUsernumber() ?? 'No number set';

  print('username: $username');
  print('email: $email');
  print('phonenumber: $phonenumber');

  setState(() {
    _username = username;
    _email = email;
    // _imageUrl = imageUrl;
    _phonenumber = phonenumber;
     usernameController.text=username;
     emailController.text=email;
     phoneController.text=phonenumber;
    // _nameController.text = _username;
    // _emailController.text = _email;
    // _phoneController.text = _phonenumber;
    // _isLoading = false;
  });
}

 final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Full Name',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                hintText: 'Enter your full name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Phone Number',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone),
                hintText: 'Enter your phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6600),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Save Changes'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
