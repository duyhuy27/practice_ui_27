import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ui_27/bloc/auth/auth_bloc.dart';
import 'package:practice_ui_27/page/auth/login_page.dart';
import 'package:practice_ui_27/page/home/home_page.dart';
import 'package:practice_ui_27/repository/user_repository.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => UserRepository(),
        child: BlocProvider(
          create: (context) => AuthBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          ),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: StreamBuilder<User?>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const HomePage();
                }
                return const LoginPage();
              },
              stream: FirebaseAuth.instance.authStateChanges(),
            ),
          ),
        ));
  }
}
