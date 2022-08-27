import 'package:flutter/material.dart';
import 'package:my_medico/data/db.dart';
import 'package:my_medico/data/repo.dart';
import 'package:my_medico/model/user.dart';
import 'package:my_medico/ui/add_account/add_account_screen.dart';
import 'package:my_medico/ui/component/my_text_field.dart';
import 'package:my_medico/ui/forget_screen/forget_screen.dart';
import 'package:my_medico/ui/home/home_screen.dart';
import 'package:my_medico/viewmodel/loading.dart';
import 'package:my_medico/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String rnLoginScreen = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
            create: (context) => LoginViewModel(), child: _Body()));
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _showMyDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void login(String username, String password, BuildContext context) async {
    print("loginscreen login called");
    context.read<LoginViewModel>().login(username, password).then((value) {
      Navigator.of(context).pushNamed(HomeScreen.rnLoginScreen);
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      _showMyDialog("Failed to Login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Login !!!"),
                SizedBox(
                  height: 100,
                ),
                Card(
                  color: Colors.yellow,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(children: [
                      getTextField1("Username", "Enter username",
                          controller: userController),
                      SizedBox(
                        height: 8,
                      ),
                      getTextField1("Password", "Enter password",
                          controller: passwordController),
                      SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            login(userController.text, passwordController.text,
                                context);
                          },
                          child: Text("Login"))
                    ]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(ForgetScreen.rnLoginScreen),
                        child: Text(
                          "Forget Password",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushNamed(AddAccountScreen.rnLoginScreen),
                        child: Text(
                          "Create Account",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
