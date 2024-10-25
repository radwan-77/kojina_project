import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/generated/l10n.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/auth_provider.dart';
import 'package:kojina_project/screen/auth-screen/singup_screen.dart';
import 'package:kojina_project/screen/location-screen/location_1.dart';
import 'package:kojina_project/widget/clickables/forgetpasswordbutton.dart';
import 'package:kojina_project/widget/clickables/mainbutton.dart';
import 'package:kojina_project/widget/input/custom_text_field.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, authConsumer, child) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/kojina_light.png",
                      width: getsize(context).width * 0.4,
                    ),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          CustomLabel(text: S.of(context).phone),
                          CustomTextField(
                            controller: phoneController,
                            validator: (validator) {
                              if (validator!.isEmpty) {
                                return "هذا الحقل مطلوب";
                              }
                              if (validator.length < 10) {
                                return "رقم الهاتف يجب ان يكون 11 رقم";
                              }
                              return null;
                            },
                            hint: "218+",
                            prefix: const Icon(Icons.phone),
                          ),
                          const CustomLabel(text: "كلمة المرور"),
                          CustomTextField(
                            controller: passwordController,
                            validator: (validator) {
                              if (validator!.isEmpty) {
                                return "هذا الحقل مطلوب";
                              }
                              if (validator.length < 6) {
                                return "كلمة المرور يجب ان تكون 6 احرف على الاقل";
                              }
                              return null;
                            },
                            obscuretext: isPasswordVisible,
                            hint: " كلمة المرور",
                            forgetPassword: true,
                            prefix: IconButton(
                              icon: Icon(
                                isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                            isPassword: !isPasswordVisible,
                          ),
                        ],
                      ),
                    ),

                    MainButton(
                      text: "تسجيل الدخول",
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          Provider.of<AuthenticationProvider>(context,
                                  listen: false)
                              .login({
                            "phone_number": phoneController.text.toString(),
                            "password": passwordController.text.toString()
                          }).then((logedIn) {
                            if (logedIn.first) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => LocationScreen1()),
                                  (route) => false);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(logedIn.last),
                              ));
                            }
                          });
                        }
                      },
                      // Keep this as fallback navigation
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                    ForGetPassword(
                        onPressed: () {},
                        text1: "ليس لديك حساب",
                        text2: "سجل الان",
                        nextpage: const SingUpScreen()),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
