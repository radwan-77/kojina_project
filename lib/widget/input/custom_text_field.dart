import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kojina_project/helper/consts.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;

  final FormFieldValidator<String?> validator;
  final String hint;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final bool forgetPassword;
  final bool isPassword;
  final bool eyevisible;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.validator,
      required this.hint,
      this.prefix,
      this.suffix,
      this.label,
      this.forgetPassword = false,
      this.isPassword = false,
      this.eyevisible = false});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Getsize(context).width * 0.9,
      child: Column(
        children: [
          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.hint,
              labelText: widget.label,
              prefixIcon: widget.prefix,
              suffixIcon: widget.suffix,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: onPrimaryLight), // Change this color
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: mainColor), // Change this color
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          if (widget.forgetPassword)
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextButton(
                  onPressed: () {},
                  child: Text("نسيت كلمة المرور؟",
                      style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "cairo")),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
