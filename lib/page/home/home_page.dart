import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ui_27/bloc/auth/auth_bloc.dart';
import 'package:practice_ui_27/bloc/auth/auth_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final User? user = FirebaseAuth.instance.currentUser;
    print(user!.email.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
            },
            child: Text("Sign Out")),
      ),
    );
  }
}
