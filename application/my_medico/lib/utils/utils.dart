import 'package:flutter/material.dart';
import 'package:my_medico/ui/add_account/add_account_screen.dart';
import 'package:my_medico/ui/forget_screen/forget_screen.dart';
import 'package:my_medico/ui/home/home_screen.dart';
import 'package:my_medico/ui/login_screen/login_screen.dart';

final routes = <String, WidgetBuilder>{
  LoginScreen.rnLoginScreen: (context) => const LoginScreen(),
  AddAccountScreen.rnLoginScreen: (context) => const AddAccountScreen(),
  ForgetScreen.rnLoginScreen: (context) => const ForgetScreen(),
  HomeScreen.rnLoginScreen: (context) => const HomeScreen(),
};

const assetsIconPath = "assets/icons";

int getHexColor(String colorString, {int fallback = 0}) {
  int value = fallback;
  try {
    String valueString =
        colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    value = int.parse(valueString, radix: 16);
  } catch (e) {
    print(e);
  }
  print("hex value is $value");
  return value;
}
