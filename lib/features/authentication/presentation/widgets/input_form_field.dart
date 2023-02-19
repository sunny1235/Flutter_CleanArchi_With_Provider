


import 'package:flutter/material.dart';

import '../provider/auth_view_model.dart';

class InputFormWidget extends StatelessWidget {

  final String title;
  final String hint;
  final bool isobscureText;
  final TextEditingController controller;
  const InputFormWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.isobscureText, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
      //padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: controller,
        obscureText: isobscureText,
        decoration:  InputDecoration(
            border: const OutlineInputBorder(),
            labelText: title,
            hintText: hint),
      ),
    );
  }
}