import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton({
    required this.child,
    required this.onPressed,
    super.key,
  });

  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.deepPurple),
          ),
          onPressed: onPressed,
          child: child,
        ),
      );
}
