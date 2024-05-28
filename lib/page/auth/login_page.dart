import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_ui_27/bloc/auth/auth_bloc.dart';
import 'package:practice_ui_27/bloc/auth/auth_state.dart';
import 'package:practice_ui_27/page/auth/auth_controller.dart';
import 'package:practice_ui_27/page/home/home_page.dart';
import 'package:practice_ui_27/res/widget/appbar_custom.dart';
import 'package:practice_ui_27/res/widget/login_social_custom.dart';
import 'package:practice_ui_27/res/widget/text_custom.dart';
import 'package:practice_ui_27/res/widget/text_form_field_custom.dart';
import 'package:practice_ui_27/utils/color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController controller = AuthController();
  bool isObscure = true;
  bool _isButtonDisabled = true;

  final FocusNode userFocus = FocusNode();
  final FocusNode passFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.onDepose();
  }

  void _validateForm() {
    setState(() {
      _isButtonDisabled = !controller.formKey.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(preferredSize: Size.fromHeight(180.0), child: AppBarCustom()),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const HomePage()));
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is UnAuthenticated) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      onChanged: _validateForm,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: TextCustom(
                                textTile: "Signin to your account",
                                color: textColor,
                                fontSized: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const TextCustom(
                              textTile: "Username",
                              color: textColor,
                              fontSized: 14,
                              fontWeight: FontWeight.w400),
                          const SizedBox(
                            height: 14,
                          ),

                          TextFormFieldCustom(
                            controller: controller.userController,
                            isObscure: false,
                            focusNode: userFocus,
                            validator: "Vui lòng nhập Member ID",
                            color: greyBorderColor,
                            hint: "Member ID",
                            isShowEyes: false,
                            icon: Icon(
                              Icons.person,
                              color: greyBorderColor,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const TextCustom(
                              textTile: "Password",
                              color: textColor,
                              fontSized: 14,
                              fontWeight: FontWeight.w400),
                          SizedBox(
                            height: 14,
                          ),
                          TextFormFieldCustom(
                            controller: controller.passController,
                            isObscure: isObscure,
                            focusNode: passFocus,
                            validator: "Vui lòng nhập mật khẩu",
                            color: greyBorderColor,
                            hint: "Password",
                            isShowEyes: true,
                            icon: Icon(
                              Icons.lock,
                              color: greyBorderColor,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          TextCustom(
                              textTile: "Forgot your password?",
                              color: greyColor,
                              fontSized: 13,
                              fontWeight: FontWeight.w400),
                          SizedBox(
                            height: 18,
                          ),
                          //button
                          SizedBox(
                            width: double.infinity, // Makes the button full-width
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _isButtonDisabled
                                  ? null
                                  : () {
                                      controller.authenticateWithEmailAndPassword(context);
                                    },
                              child: Text(
                                "Signin",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16, // Font size
                                  fontWeight: FontWeight.bold, // Font weight
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), // Rounded corners
                                ),
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16, // Font size
                                  fontWeight: FontWeight.bold, // Font weight
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextCustom(
                                    textTile: "Don't have an account?",
                                    color: greyColor,
                                    fontSized: 13,
                                    fontWeight: FontWeight.w400),
                                SizedBox(
                                  width: 10,
                                ),
                                TextCustom(
                                    textTile: "sign up",
                                    color: primaryColor,
                                    fontSized: 13,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    height: 1,
                                    color: dividerColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextCustom(
                                    textTile: "Or",
                                    color: greyColor,
                                    fontSized: 13,
                                    fontWeight: FontWeight.w400),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Divider(
                                    height: 1,
                                    color: dividerColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LoginSocialCustom(
                              imgUrlFaceBook: "assets/images/facebook.png",
                              imgUrlCall: "assets/images/call_logo.png"),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              "Choose your language",
                              style: GoogleFonts.kanit(
                                textStyle: TextStyle(
                                    color: textColor, fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
