import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;

  final FormFieldValidator<String?> validator;
  final String hint;
  final String? label;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? forgetscreen;
  final bool forgetPassword;
  final bool isPassword;
  final bool eyevisible;
  final bool obscuretext;

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
      this.eyevisible = false,
      this.obscuretext = false,
      this.forgetscreen});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getsize(context).width * 0.9,
      child: Column(
        children: [
          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.obscuretext,
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          if (widget.forgetPassword)
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: TextButton(
                  onPressed: () {
                    if (widget.forgetscreen != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => widget.forgetscreen!),
                      );
                    }
                  },
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
