import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getTextField1(String label, String hint) {
  return TextField(
    decoration: InputDecoration(
      isDense: true,
      filled: true,
      fillColor: Colors.blue.shade100,
      border: OutlineInputBorder(),
      labelText: label,
      hintText: hint,
      // helperText: 'help',
      // counterText: 'counter',
      //icon: Icon(Icons.star),
      prefixIcon: Icon(Icons.favorite),
      suffixIcon: Icon(Icons.park),
    ),
  );
}
