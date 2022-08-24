import 'package:flutter/material.dart';
import 'package:my_medico/data/db.dart';
import 'package:my_medico/data/repo.dart';
import 'package:my_medico/ui/add_account/add_account_screen.dart';
import 'package:my_medico/ui/component/my_text_field.dart';
import 'package:my_medico/ui/forget_screen/forget_screen.dart';
import 'package:my_medico/viewmodel/loading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String rnLoginScreen = '/LoginScreen';
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  Future<void> login(
      String username, String password, BuildContext context) async {
    print("loginscreen login called");
    LoadingViewModel loadingViewModel =
        Provider.of<LoadingViewModel>(context, listen: false);
    loadingViewModel.changeState(true);
    print("loginscreen login called2");
    await Repo().login("username", "password");
    print("loginscreen login called3");
    loadingViewModel.changeState(false);
    print("loginscreen login called 4");
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
                      getTextField1("Username", "Enter username"),
                      SizedBox(
                        height: 8,
                      ),
                      getTextField1("Password", "Enter password"),
                      SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            login("username", "password", context);
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
