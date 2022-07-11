import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme.dart';

class DatePickerReserv extends StatelessWidget {
  final dynamic Function(DateTime)? onConfirm;
  final DateTime? dateSelect;

  const DatePickerReserv({
    required this.onConfirm,
    required this.dateSelect,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: AppColors.green)),
      child: TextButton(
          onPressed: () async {
            var resp = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(
                const Duration(days: 6),
              ),
              locale: const Locale('es', 'ES'),
            );

            if (resp != null) {
              return onConfirm!(resp);
            }
          },
          child: Row(
            children: [
              const Icon(Icons.calendar_month_outlined),
              const SizedBox(width: 8),
              Text(
                dateSelect == null
                    ? 'Seleccione una fecha'
                    : DateFormat.yMMMMd('es').format(dateSelect!),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grey),
              ),
            ],
          )),
    );
  }
}
