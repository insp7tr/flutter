import 'package:ecommerce_app/app/shared/colors.dart';
import 'package:ecommerce_app/app/shared/dimensions.dart';
import 'package:ecommerce_app/core/providers/auth_provider.dart';
import 'package:ecommerce_app/meta/views/auth/signup_view.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSizedBox3,
              vSizedBox1,
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        EvaIcons.arrowIosBackOutline,
                        color: whiteColor,
                      ))
                ],
              ),
              vSizedBox4,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Let's sign you in.",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: whiteColor),
                  ),
                  Text(
                    "Welcome back.",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: whiteColor),
                  ),
                  Text(
                    "You've been missed",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: whiteColor),
                  )
                ],
              ),
              vSizedBox3,
              vSizedBox1,
              Column(
                children: [
                  vSizedBox1,
                  stylishTextField("Email", emailController),
                  vSizedBox1,
                  stylishTextField("Password", passwordController),
                ],
              ),
              vSizedBox4,
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Montserrat")),
                        TextSpan(
                            text: "Signup",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        child: SignupView(),
                                        type: PageTransitionType.rightToLeft));
                              },
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                color: textColor,
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat")),
                      ],
                    ),
                  ),
                  vSizedBox2,
                  GestureDetector(
                    onTap: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        Provider.of<AuthProvider>(context, listen: false)
                            .login({
                          "useremail": emailController.text,
                          "userpassword": passwordController.text
                        });
                      }
                    },
                    child: Container(
                      width: 300.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(1),
                          borderRadius: BorderRadius.circular(18.0)),
                      child: const Center(
                          child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Montserrat"),
                      )),
                    ),
                  )
                ],
              ))
            ]),
      ),
    );
  }

  stylishTextField(String text, TextEditingController textEditingController) {
    return TextField(
      controller: textEditingController,
      style: const TextStyle(color: whiteColor, fontSize: 18.0),
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              EvaIcons.backspace,
              color: textColor,
            ),
          ),
          filled: true,
          hintText: text,
          hintStyle: const TextStyle(color: textColor, fontSize: 14),
          fillColor: bgColor,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(15)))),
    );
  }
}
