import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/screen/auth-screen/forget_password_screen.dart';
import 'package:kojina_project/screen/auth-screen/login_screen.dart';
import 'package:kojina_project/widget/clickables/mainbutton.dart';
import 'package:kojina_project/widget/input/custom_text_field.dart';

class SendEmailScreen extends StatefulWidget {
  const SendEmailScreen({super.key});

  @override
  State<SendEmailScreen> createState() => _SendEmailScreenState();
}

class _SendEmailScreenState extends State<SendEmailScreen> {
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
              'Enter your email to send a reset password link',
              style: normal15,
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
              hint: "Email",
              prefix: Icon(Icons.email),
            ),            
            SizedBox(height: 20),
            MainButton(
              text: "Confirm Password",
              onPressed: () {
                // send email to reset password
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgetPasswordScreen(),
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
