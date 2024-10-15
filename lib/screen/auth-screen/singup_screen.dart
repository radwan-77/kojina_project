import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/screen/auth-screen/login_screen.dart';
import 'package:kojina_project/screen/main-screen/home_screen.dart';
import 'package:kojina_project/widget/clickables/forgetpasswordbutton.dart';
import 'package:kojina_project/widget/clickables/mainbutton.dart';
import 'package:kojina_project/widget/input/custom_text_field.dart';
import 'package:kojina_project/widget/static/custom_label.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 48),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/kojina_light.png",
                  width: Getsize(context).width * 0.4,
                ),
                // const SizedBox(
                //   height: 8,
                // ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      const CustomLabel(text: "الاسم"),
                      CustomTextField(
                        controller: nameController,
                        validator: (validator) {
                          if (validator!.isEmpty) {
                            return "هذا الحقل مطلوب";
                          }
                          return null;
                        },
                        hint: "الاسم",
                        prefix: const Icon(Icons.person),
                      ),
                      const CustomLabel(text: "البريد الالكتروني"),
                      CustomTextField(
                          controller: emailController,
                          validator: (validator) {
                            if (validator!.isEmpty) {
                              return "هذا الحقل مطلوب";
                            }
                            if (!validator.contains("@")) {
                              return "البريد الألكتروني غير صحيح";
                            }
                          },
                          hint: "البريد الألكتروني"),
                      const CustomLabel(text: "رقم الهاتف"),
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
                    text: "أنشاء حساب ",
                    onPressed: () {},
                    nextpage: LoginScreen()),
                forgetPassword(
                    onPressed: () {},
                    text1: "لديك حساب",
                    text2: "تسجيل الدخول",
                    nextpage: LoginScreen())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
