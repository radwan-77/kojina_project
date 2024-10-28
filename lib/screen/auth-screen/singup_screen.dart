import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/provider/auth_provider.dart';
import 'package:kojina_project/screen/auth-screen/login_screen.dart';
import 'package:kojina_project/screen/auth-screen/send_email.dart';
import 'package:kojina_project/screen/main-screen/main_screen.dart';
import 'package:kojina_project/widget/clickables/forgetpasswordbutton.dart';
import 'package:kojina_project/widget/clickables/mainbutton.dart';
import 'package:kojina_project/widget/input/custom_text_field.dart';
import 'package:kojina_project/widget/static/custom_label.dart';
import 'package:provider/provider.dart';

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
    return Consumer<AuthenticationProvider>(
        builder: (context, authConsumer, _) {
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
                    width: getsize(context).width * 0.4,
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
                              return null;
                            },
                            hint: "البريد الألكتروني"),
                        const CustomLabel(text: "رقم الهاتف"),
                        CustomTextField(
                          controller: phoneController,
                          validator: (validator) {
                            if (validator!.isEmpty) {
                              return "هذا الحقل مطلوب";
                            }
                            if (validator.length < 10) {
                              return "كسم البرمجه";
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
                          forgetscreen: SendEmailScreen(),
                        ),
                      ],
                    ),
                  ),
                  MainButton(
                    text: "أنشاء حساب ",
                    // issue here the navigtor push not working
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Provider.of<AuthenticationProvider>(context,
                                listen: false)
                            .register({
                          "full_name": nameController.text,
                          "phone_number": phoneController.text,
                          "email": emailController.text,
                          "password": passwordController.text,
                          "password_confirmation": passwordController.text,
                        }).then((created) {
                          print(created);
                          if (created.first) {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(created.last),
                            ));
                          }
                        });
                      }
                    },
                  ),

                  ForGetPassword(
                      onPressed: () {},
                      text1: "لديك حساب",
                      text2: "تسجيل الدخول",
                      nextpage: const LoginScreen())
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
