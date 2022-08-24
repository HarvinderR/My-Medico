import 'package:flutter/material.dart';
import 'package:my_medico/ui/component/my_text_field.dart';

class AddAccountScreen extends StatelessWidget {
  static const String rnLoginScreen = '/AddAccountScreen';
  const AddAccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getTextField1("Name", "Enter name"),
          SizedBox(
            height: 8,
          ),
          getTextField1("Username", "Enter username"),
          SizedBox(
            height: 8,
          ),
          getTextField1("Email-Id", "Enter email id"),
          SizedBox(
            height: 8,
          ),
          getTextField1("Address", "Enter address"),
          SizedBox(
            height: 8,
          ),
          getTextField1("Password", "Enter password"),
          SizedBox(
            height: 8,
          ),
          getTextField1("Confirm Passworr", "Enter confirm password"),
          SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Submit"))
        ],
      )),
    );
  }
}
