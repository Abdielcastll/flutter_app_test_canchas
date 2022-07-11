import 'package:flutter/material.dart';

import '../../theme.dart';

class ReserveTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  const ReserveTextField({
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.grey),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.perm_identity_rounded),
          label: const Text('Nombre'),
          labelStyle: const TextStyle(fontSize: 18),
          hintText: 'La reserva estará a tu nombre',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
