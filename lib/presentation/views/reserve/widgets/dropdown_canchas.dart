import 'package:flutter/material.dart';

import '../../../../domain/model/cancha_model.dart';
import '../../theme.dart';

class DropDownCanchas extends StatelessWidget {
  final String hint;
  final String? value;
  final Function(String?) onChanged;
  final List<Court> canchas;

  const DropDownCanchas(
      {required this.canchas,
      required this.hint,
      required this.value,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.all(15),
      child: Container(
        // height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.green.withOpacity(0.2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DropdownButton(
          value: value,
          items: _opcionesItem(),
          selectedItemBuilder: (BuildContext context) {
            return canchas.map<Widget>((item) {
              return _item(item);
            }).toList();
          },
          onChanged: onChanged,
          borderRadius: BorderRadius.circular(5),
          hint: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                hint,
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )),
          isExpanded: true,
          underline: Container(),
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 26,
          dropdownColor: Colors.grey[100],
        ),
      ),
    );
  }

  Align _item(Court item) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        item.name,
        textAlign: TextAlign.left,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  List<DropdownMenuItem<String>> _opcionesItem() {
    List<DropdownMenuItem<String>> lista = [];
    for (var e in canchas) {
      lista.add(
        DropdownMenuItem(
          child: Row(
            children: [
              Text(
                e.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                e.address,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700]),
              ),
            ],
          ),
          value: e.name,
        ),
      );
    }
    return lista;
  }
}
