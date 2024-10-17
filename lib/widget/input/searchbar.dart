import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kojina_project/helper/consts.dart';
import 'package:kojina_project/helper/function_helper.dart';

class CustomeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hint; 
  final String? label;
  final Widget? prefix;
  final Widget? suffix;

  const CustomeSearchBar(
      {super.key,
      required this.controller,
      required this.hint,
      this.label,
      this.prefix,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getsize(context).width * 0.89,
      height: 80,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          prefixIcon: prefix,
          suffixIcon: suffix,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: onPrimaryLight), // Change this color
            borderRadius: BorderRadius.circular(100),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: mainColor), // Change this color
            borderRadius: BorderRadius.circular(100),
          ),
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
