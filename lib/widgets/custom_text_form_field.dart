import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    required this.type,
    required this.empty,
    required this.hint,
    required this.icon,
    required this.txt,
    super.key,
  });

  final TextEditingController controller;
  final String empty;
  final TextInputType type;
  final String hint;
  final Icon icon;
  final bool txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
            controller: controller,
            obscureText: txt,
            validator: (value) {
              if (value!.isEmpty) {
                return empty;
              }
              return null;
            },
            keyboardType: type,
            decoration: InputDecoration(
              prefixIcon: icon,
              hintText: hint,
              border: const OutlineInputBorder(),
            )));
  }
}
