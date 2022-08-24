import 'package:flutter/material.dart';
import 'package:my_medico/ui/component/my_text_field.dart';

class ForgetScreen extends StatelessWidget {
  static const String rnLoginScreen = '/ForgetScreen';
  const ForgetScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Card(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            getTextField1("Email-Id", "Enter email id"),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Reset Password"))
          ]),
        ),
      ),
    );
  }
}
