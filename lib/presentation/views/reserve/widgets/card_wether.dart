import 'package:flutter/material.dart';

import '../../theme.dart';

class CardWeather extends StatelessWidget {
  final String icon;
  final String desc;
  final String probPrecipPct;
  const CardWeather({
    required this.icon,
    required this.desc,
    required this.probPrecipPct,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset('assets/icons/$icon'),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    desc,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Probabilidad de lluvia: $probPrecipPct %',
                    style: TextStyle(
                        color: AppColors.grey, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
