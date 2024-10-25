import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: getsize(context).height * 0.18,
              ),
              Image.asset(
                "assets/location.png",
                width: getsize(context).width * 0.5,
                // opacity: AlwaysStoppedAnimation(0.8),
              ),
              SizedBox(
                height: 20,
              ),
              Text("يرجى تحديد الموقع الحالي", style: bold20),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: locationcontroller,
                  validator: (validator) {},
                  hint: "الموفع الحالي"),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                  controller: namecontroller,
                  validator: (validator) {},
                  hint: " اسم الموقع"),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: descrptioncontrollrt,
                validator: (validator) {},
                hint: "الوصف(اختياري)",
              ),
              SizedBox(
                height: 20,
              ),
              MainButton(
                text: "تاكيد الموقع",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
