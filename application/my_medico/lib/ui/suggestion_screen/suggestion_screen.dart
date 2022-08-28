import 'package:flutter/material.dart';

class SuggestionScreen extends StatelessWidget {
  static const String rnLoginScreen = '/SuggestionScreen';
  const SuggestionScreen({Key? key}) : super(key: key);
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
          hintText: "Enter a message",
          fillColor: Colors.grey[300],
          filled: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Text(
          "Suggestion/Feedback",
          style: TextStyle(fontSize: 28),
        )),
        SizedBox(
          height: 40,
        ),
        _buildTextField(),
        ElevatedButton(
          onPressed: () {},
          child: Text("Submit"),
        ),
      ]),
    );
  }
}
