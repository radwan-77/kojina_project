import 'package:flutter/material.dart';
import 'package:kojina_project/generated/l10n.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/screen/auth-screen/singup_screen.dart';
import 'package:kojina_project/screen/main-screen/home_screen.dart';
import 'package:kojina_project/widget/clickables/forgetpasswordbutton.dart';
import 'package:kojina_project/widget/clickables/mainbutton.dart';
import 'package:kojina_project/widget/input/custom_text_field.dart';
import 'package:kojina_project/widget/static/custom_label.dart';

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
                          if (validator.length < 11) {
                            return "رقم الهاتف يجب ان يكون 11 رقم";
                          }
                        },
                        hint: "218+",
                        prefix: const Icon(Icons.phone),
                      ),
                      const CustomLabel(text: "كلمة المرور"),
                      CustomTextField(
                        controller: passwordController,
                        validator: (validator) {},
                        hint: "********",
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
                    onPressed: () {},
                    nextpage: const HomeScreen()),
                const SizedBox(
                  height: 8,
                ),
                forgetPassword(
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
  }
}
