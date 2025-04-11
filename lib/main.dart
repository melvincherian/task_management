import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_management/features/domain/repositories/firebase/auth_repoistory.dart';
import 'package:task_management/features/presentation/bloc/authbloc/bloc/authentication_bloc.dart';
import 'package:task_management/features/presentation/bloc/imagebloc/bloc/image_bloc.dart';
import 'package:task_management/features/presentation/pages/splash/splash_screen.dart';
import 'package:task_management/features/presentation/provider/bottom_navbar_provider.dart';
import 'package:task_management/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavbarProvider>(
            create: (_) => BottomNavbarProvider())
      ],
      child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (context) =>
                  AuthenticationBloc(authrepository: AuthRepoistory()),
            ),
            BlocProvider<ImageBloc>(create: (context) => ImageBloc())
          ],
          child: const MaterialApp(
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
          )),
    );
  }
}
