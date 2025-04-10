// ignore_for_file: no_leading_underscores_for_local_identifiers, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/features/presentation/bloc/authbloc/bloc/authentication_bloc.dart';
import 'package:task_management/features/presentation/pages/authenticaton/login_screen.dart';
import 'package:task_management/features/presentation/widgets/Textfields/custom_textfield.dart';
import 'package:task_management/features/presentation/widgets/elevatedbutton/custom_button.dart';
import 'package:task_management/features/presentation/widgets/snackbar/snackbar.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final dobController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F0EE),
      body: BlocListener<AuthenticationBloc,AuthenticationState>(
        listener:(context, state) {
          if(state is AuthenticationSuccess && state.source=='signup'){

             ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Signup Successfully",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          }else if (state is AuthenticationFailure) {
            showSnackbar(context, state.error);
          }
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  const Text(
                    "TO-DO",
                    style: TextStyle(
                      color: Color(0xFFFF6200),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                        const Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Sign UP',
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen()));
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Color(0xFFFF6600),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomTextfield(
                          label: 'Full Name',
                          hintText: 'Full Name',
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter username';
                            } else if (!RegExp(r'^[a-zA-Z0-9_]+$')
                                .hasMatch(value)) {
                              return 'Username can only contain letters, digits, and underscores';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextfield(
                          label: 'Email',
                          hintText: 'Email',
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextfield(
                          label: 'Date of Birth',
                          hintText: 'Select your birth date',
                          controller: dobController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your date of birth';
                            }
        
                            try {
                              // Split and parse the date
                              final parts = value.split('-');
                              if (parts.length != 3)
                                return 'Enter date in DD-MM-YYYY format';
        
                              final day = int.parse(parts[0]);
                              final month = int.parse(parts[1]);
                              final year = int.parse(parts[2]);
        
                              final selectedDate = DateTime(year, month, day);
                              final now = DateTime.now();
        
                              if (selectedDate.isAfter(now)) {
                                return 'Date of birth cannot be in the future';
                              }
        
                              final age =
                                  now.difference(selectedDate).inDays ~/ 365;
                              if (age < 18) {
                                return 'You must be at least 18 years old';
                              }
        
                              return null;
                            } catch (e) {
                              return 'Invalid date format';
                            }
                          },
                          readOnly: true,
                          suffixIcon: Icons.calendar_today,
                          onSuffixIconTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now()
                                  .subtract(const Duration(days: 365 * 18)),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (pickedDate != null) {
                              dobController.text =
                                  "${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}";
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextfield(
                          label: 'Phone Number',
                          hintText: 'Phone Number',
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Phone number';
                            } else if (!RegExp(r'^\+?[0-9]{10,15}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextfield(
                          label: 'Set Password',
                          hintText: 'Set Password',
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Password';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 20),
                        Center(
                          child:CustomElevatedButton(
                            label: 'Sign Up',
                            isLoading: context.watch<AuthenticationBloc>().state
                                is AuthenticationLoading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthenticationBloc>().add(
                                      SignupRequested(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          source: 'signup'),
                                    );
                              }
                              
                            },
                          )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
