import 'package:flutter/material.dart';

class ButtonFloating extends StatelessWidget {
  const ButtonFloating({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      elevation: 3,
    );
  }
}
