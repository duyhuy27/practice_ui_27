import 'package:flutter/material.dart';

class LoginSocialCustom extends StatefulWidget {
  final String imgUrlFaceBook;
  final String imgUrlCall;
  const LoginSocialCustom({super.key, required this.imgUrlFaceBook, required this.imgUrlCall});

  @override
  State<LoginSocialCustom> createState() => _LoginSocialCustomState();
}

class _LoginSocialCustomState extends State<LoginSocialCustom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 82,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image.asset(
              widget.imgUrlFaceBook,
              width: 30,
              height: 30,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            // controller.SignUpWithEmailAndPassword(
            //     context, formKey, userController, passController);
          },
          child: Container(
            height: 60,
            width: 82,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                widget.imgUrlCall,
                width: 30,
                height: 30,
              ),
            ),
          ),
        )
      ],
    );
  }
}
