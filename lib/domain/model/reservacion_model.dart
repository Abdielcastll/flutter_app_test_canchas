class Reservation {
  int? id;
  DateTime fecha;
  String nombreUsuario;
  String climaIcon;
  String climaPrecPorc;
  String climaDesc;
  String nombreCancha;
  String ubicacionCancha;
  String imgCancha;

  Reservation({
    this.id,
    required this.fecha,
    required this.nombreUsuario,
    required this.climaIcon,
    required this.climaPrecPorc,
    required this.climaDesc,
    required this.nombreCancha,
    required this.ubicacionCancha,
    required this.imgCancha,
  });

  factory Reservation.fromMap(Map<String, dynamic> json) {
    return Reservation(
        id: json['id'],
        fecha: DateTime.parse(json['fecha']),
        nombreUsuario: json['nombreUsuario'],
        climaIcon: json['climaIcon'],
        climaPrecPorc: json['climaPrecPorc'],
        climaDesc: json['climaDesc'],
        nombreCancha: json['nombreCancha'],
        ubicacionCancha: json['ubicacionCancha'],
        imgCancha: json['imgCancha']);
  }

  Map<String, String> toJson() => {
        'fecha': fecha.toString(),
        'nombreUsuario': nombreUsuario,
        'climaIcon': climaIcon,
        'climaPrecPorc': climaPrecPorc,
        'climaDesc': climaDesc,
        'nombreCancha': nombreCancha,
        'ubicacionCancha': ubicacionCancha,
        'imgCancha': imgCancha,
      };
}
