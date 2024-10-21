import 'package:flutter/material.dart';
import 'package:kojina_project/helper/function_helper.dart';
import 'package:kojina_project/screen/main-screen/main_screen.dart';
import 'package:kojina_project/widget/clickables/mainbutton.dart';
import 'package:kojina_project/widget/input/custom_text_field.dart';

class LocationScreen2 extends StatefulWidget {
  LocationScreen2({super.key});

  @override
  State<LocationScreen2> createState() => _LocationScreen2State();
}

class _LocationScreen2State extends State<LocationScreen2> {
  TextEditingController locationcontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController descrptioncontrollrt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: getsize(context).height * 0.2,
            ),
            Image.asset(
              "assets/chat.png",
              width: getsize(context).width * 0.5,
            ),
            SizedBox(
              height: 40,
            ),
            CustomTextField(
                controller: locationcontroller,
                validator: (validator) {

                },
                hint: "langtoit and latutit"),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
                controller: namecontroller,
                validator: (validator) {

                },
                hint: "langtoit and latutit"),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
                controller: descrptioncontrollrt,
                validator: (validator) {
                  
                },
                hint: "langtoit and latutit"),
            SizedBox(
              height: 20,
            ),
            MainButton(
              nextpage: MainScreen(),
              text: "تاكيد الموقع",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
