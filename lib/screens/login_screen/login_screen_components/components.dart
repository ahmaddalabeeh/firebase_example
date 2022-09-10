import 'package:flutter/material.dart';

class textFormField extends StatelessWidget {
  const textFormField(this.type, this.empty, this.hint, this.icon, this.txt,
      {super.key});
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

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.deepPurple)),
        onPressed: () {},
        child: child,
      );
}
