import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/screen/auth-screen/forget_password_screen.dart';
import 'package:kojina_project/widget/clickables/mainbutton.dart';
import 'package:kojina_project/widget/input/custom_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Send a reset password link to your email',
              style: normal15,
            ),
            SizedBox(height: 20),
            CustomTextField(
                controller: controller,
                validator: (v) {},
                hint: "Email",
                prefix: Icon(Icons.email)),
            SizedBox(height: 20),
            MainButton(text: "send Email", onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ForgetPasswordScreen(),
                ),
              );
            } ,
             )
          ],
        ),
      ),
    );
  }
}
