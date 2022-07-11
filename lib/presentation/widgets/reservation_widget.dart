import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/model/reservacion_model.dart';

class ReservationCardWidget extends StatelessWidget {
  const ReservationCardWidget(
    this.reservation, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  final void Function()? onPressed;
  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 3,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                reservation.imgCancha,
                width: MediaQuery.of(context).size.width * .20,
                height: MediaQuery.of(context).size.width * .20,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      reservation.nombreCancha,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    reservation.nombreUsuario,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMMd('es').format(reservation.fecha),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        reservation.climaDesc,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Image.asset(
                        'assets/icons/${reservation.climaIcon}',
                        scale: 1.2,
                      ),
                    ],
                  )
                ],
              ),
            ),
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.delete_outline_rounded,
                  size: 30,
                  color: Colors.red[800],
                ))
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
