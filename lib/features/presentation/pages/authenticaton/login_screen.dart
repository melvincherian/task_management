import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/features/data/models/repositories/user_data.dart';
import 'package:task_management/features/presentation/bloc/authbloc/bloc/authentication_bloc.dart';
import 'package:task_management/features/presentation/pages/authenticaton/forgot_pass.dart';
import 'package:task_management/features/presentation/pages/authenticaton/signup_screen.dart';
import 'package:task_management/features/presentation/pages/home/navbar_screen.dart';
import 'package:task_management/features/presentation/widgets/Textfields/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final googleController=TextEditingController();
  bool rememberMe = false;

  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
  final height = size.height;
  final width = size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F0EE),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) async {
          if (state is AuthenticationLoading) {}
          if (state is AuthenticationSuccess && state.source == 'google') {
            await SharedPrefHelper().saveUserGoogle(googleController.text);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NavbarScreen()));
          }
          if (state is AuthenticationSuccess && state.source == 'login') {
              await SharedPrefHelper().saveUserEmail(emailController.text);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "Login Successfully",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>const NavbarScreen()));
          }
          if (state is AuthenticationFailure && state.source == 'login') {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Invalid Email and password'),
              backgroundColor: Colors.red,
            ));
          }
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.06),
              child: Column(
                children: [
                  SizedBox(height: height * 0.05),
                   Text(
                    "TO-DO",
                    style: TextStyle(
                      color: Color(0xFFFF6200),
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.5,
                    ),
                  ),
                     SizedBox(height: height * 0.04),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.03),
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
                         Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                               fontSize: height * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                         SizedBox(height: height * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen()));
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color(0xFFFF6600),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        CustomTextfield(
                          label: 'Email',
                          hintText: 'Email',
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                          SizedBox(height: height * 0.02),
                        CustomTextfield(
                          label: 'Password',
                          hintText: 'Password',
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                       SizedBox(height: height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },
                                  activeColor: const Color(0xFFFF6600),
                                ),
                                const Text('Remember me'),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassScreen()));
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Color(0xFFFF4800),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.025),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _onLoginRequested();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF6600),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.31, vertical: height * 0.02),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              elevation: 5,
                              textStyle:  TextStyle(
                                fontSize: height * 0.022,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text('Log In'),
                          ),
                        ),
                          SizedBox(height: height * 0.025),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                             padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                              child: Text(
                                'or',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.025),
                        Center(
                          child: TextButton.icon(
                            onPressed: () {
                              _loginWithgoogle();
                            },
                            icon: Image.network(
                              'https://53.fs1.hubspotusercontent-na1.net/hub/53/hubfs/image8-2.jpg?width=595&height=400&name=image8-2.jpg',
                              height: height * 0.035,
                            width: height * 0.035,
                            ),
                            label:  Text(
                              'Continue with Google',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: height * 0.02,
                              ),
                            ),
                            style: TextButton.styleFrom(
                               padding: EdgeInsets.symmetric(
                                vertical: height * 0.016, horizontal: width * 0.06),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
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

  void _onLoginRequested() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthenticationBloc>().add(LoginRequested(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          source: 'login'));
    //        context.read<AuthenticationBloc>().stream.listen((state) async {
    //   if (state is AuthenticationSuccess) {
    //     final prefs = await SharedPreferences.getInstance();
    //     await prefs.setBool('userLogged', true);
    //      print("Login state saved: ${prefs.getBool('userLogged')}"); // Save login status
    //   }
    // });
          
    }
  }

  void _loginWithgoogle() {
    context.read<AuthenticationBloc>().add(GoogleLoginRequested());
  }
}
