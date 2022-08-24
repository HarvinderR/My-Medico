import 'package:flutter/material.dart';
import 'package:my_medico/ui/add_account/add_account_screen.dart';
import 'package:my_medico/ui/forget_screen/forget_screen.dart';
import 'package:my_medico/ui/login_screen/login_screen.dart';

final routes = <String, WidgetBuilder>{
  LoginScreen.rnLoginScreen: (context) => const LoginScreen(),
  AddAccountScreen.rnLoginScreen: (context) => const AddAccountScreen(),
  ForgetScreen.rnLoginScreen: (context) => const ForgetScreen(),
};
