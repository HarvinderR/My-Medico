import 'package:flutter/material.dart';
import 'package:my_medico/ui/component/my_text_field.dart';
import 'package:my_medico/viewmodel/forget_password_viewmodel%20.dart';
import 'package:provider/provider.dart';

class ForgetScreen extends StatelessWidget {
  static const String rnLoginScreen = '/ForgetScreen';
  const ForgetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
            create: (context) => ForgetPasswordViewModel(), child: _Body()));
  }
}

class _Body extends StatefulWidget {
  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  TextEditingController controller = TextEditingController();

  Future<void> _showMyDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Forget Password'),
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

  void forgetPwd() {
    context
        .read<ForgetPasswordViewModel>()
        .sendEmail(controller.text)
        .then((value) {
      if (value) {
        Navigator.of(context).pop();
      } else {
        print("Fail to reset Password");
        _showMyDialog('Fail to reset Password');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            getTextField1("Email-Id", "Enter email id", controller: controller),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () {
                  forgetPwd();
                },
                child: Text("Reset Password"))
          ]),
        ),
      ),
    );
  }
}
