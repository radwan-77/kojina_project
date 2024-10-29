import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/screen/auth-screen/login_screen.dart';
import 'package:kojina_project/widget/clickables/mainbutton.dart';
import 'package:kojina_project/widget/input/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'entter to reset password',
              style: normal15,
            ),
            SizedBox(height: 50),
            CustomTextField(
              onTap: () {},
              controller: emailcontroller,
              validator: (v) {
                if (v!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              hint: "Password",
              prefix: Icon(Icons.email),
            ),            
            SizedBox(height: 20),
            CustomTextField(
              onTap: () {},
              controller: emailcontroller,
              validator: (v) {
                if (v!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              hint: " Confirm Password",
              prefix: Icon(Icons.email),
            ), 

            SizedBox(height: 30),



            MainButton(
              text: "Change Password",
              onPressed: () {
                // update the password
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
