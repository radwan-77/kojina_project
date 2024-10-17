import 'package:flutter/material.dart';


// <---------------------colors-------------------->
const Color mainColor = Color(0xFF8dbc9f);
const Color onPrimaryLight = Color(0xFF1e1e1e);
const Color onPrimaryDark = Color(0xFFffffff);
const Color tertiaryDark = Color(0xFF5a5a5a);
const Color tertiaryLight = Color(0xFFc0c0c0);
const Color errorColor = Color(0xFFE70013);
// <---------------------functions-------------------->

getsize(context){
 return MediaQuery.of(context).size;
  
}

// <---------------------textstyles-------------------->
TextStyle titleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: onPrimaryLight,
);
TextStyle subtitleStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: onPrimaryLight,
);
TextStyle bodyStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: onPrimaryLight,
);
TextStyle errorStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: errorColor,
);
TextStyle buttonStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: onPrimaryDark,
);
TextStyle linkStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: mainColor,
);
TextStyle inputStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: onPrimaryLight,
);
TextStyle inputHintStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: tertiaryDark,
);
TextStyle inputErrorStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: errorColor,
);
TextStyle inputLabelStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: tertiaryDark,
);
TextStyle inputCounterStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: tertiaryDark,
);
TextStyle inputDecorationStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: onPrimaryLight,
);
TextStyle inputDecorationHintStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: tertiaryDark,
);
TextStyle inputDecorationErrorStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: errorColor,
);
TextStyle inputDecorationLabelStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.normal,
  color: tertiaryDark,
);
TextStyle inputDecorationCounterStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: tertiaryDark,
);
TextStyle appBarTitleStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: onPrimaryDark,
);








