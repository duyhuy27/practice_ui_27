import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_ui_27/bloc/auth/auth_bloc.dart';
import 'package:practice_ui_27/bloc/auth/auth_event.dart';
import 'package:practice_ui_27/utils/validators.dart';

class AuthController {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onDepose() {
    userController.dispose();
    passController.dispose();
  }

  void authenticateWithEmailAndPassword(context) {
    if (formKey.currentState!.validate() || Validators.isValidEmail(userController.text)) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(userController.text, passController.text),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Input")));
    }
  }

  void SignUpWithEmailAndPassword(context) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(userController.text, passController.text),
      );
    }
  }
}
