import 'package:flutter/material.dart';

class Starts extends StatelessWidget {
  const Starts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rounded,
          color: Colors.yellow[700],
          size: 25,
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.yellow[700],
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.yellow[700],
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.yellow[700],
        ),
        Icon(
          Icons.star_rounded,
          color: Colors.yellow[700],
        ),
      ],
    );
  }
}
