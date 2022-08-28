import 'package:flutter/material.dart';

class PrescriptionScreen extends StatelessWidget {
  static const String rnLoginScreen = '/PrescriptionScreen';
  const PrescriptionScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Body());
  }
}

class _Body extends StatelessWidget {
  Widget _buildTextField() {
    final maxLines = 5;

    return Container(
      margin: EdgeInsets.all(12),
      height: maxLines * 24.0,
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: "Enter the prescription",
          fillColor: Colors.grey[300],
          filled: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Expanded(
          child: Center(
            child: Icon(
              Icons.camera_alt,
              size: 50,
            ),
          ),
        ),
        Text("~~~ OR ~~~"),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(),
              ElevatedButton(
                onPressed: () {},
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
