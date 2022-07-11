import 'package:flutter/material.dart';

import '../../../../domain/model/cancha_model.dart';
import 'starts_widgets.dart';

class CanchaSelectWidget extends StatelessWidget {
  final Court cancha;
  const CanchaSelectWidget({
    required this.cancha,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  cancha.img,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cancha.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    cancha.address,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey[600]),
                  ),
                  const Starts()
                ],
              ),
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
