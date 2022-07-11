import 'package:flutter/material.dart';
import '../views/theme.dart';

abstract class Dialogs {
  static alert(
    BuildContext context, {
    required String text,
  }) {
    showDialog(
      barrierColor: Colors.white60,
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static confirmDelete(
    BuildContext context, {
    required String text,
    required void Function()? ok,
  }) {
    showDialog(
      barrierColor: Colors.white60,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
                onPressed: ok,
                child: const Text(
                  'Borrar',
                  style: TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ))
          ],
        );
      },
    );
  }
}
