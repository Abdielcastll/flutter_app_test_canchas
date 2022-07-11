import 'package:intl/intl.dart';

class Weather {
  Weather({
    required this.days,
  });

  List<Day> days;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        days: List<Day>.from(json["Days"].map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Days": List<dynamic>.from(days.map((x) => x.toJson())),
      };
}

class Day {
  Day({
    required this.date,
    required this.timeframes,
  });

  DateTime date;
  List<Timeframe> timeframes;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        date: DateFormat('dd/MM/yyyy').parse(json["date"]),
        timeframes: List<Timeframe>.from(
            json["Timeframes"].map((x) => Timeframe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "Timeframes": List<dynamic>.from(timeframes.map((x) => x.toJson())),
      };
}

class Timeframe {
  Timeframe({
    required this.time,
    required this.wxDesc,
    required this.wxIcon,
    required this.probPrecipPct,
  });

  int time;
  String wxDesc;
  String wxIcon;
  String probPrecipPct;

  factory Timeframe.fromJson(Map<String, dynamic> json) => Timeframe(
        time: json["time"],
        wxDesc: json["wx_desc"],
        wxIcon: json["wx_icon"],
        probPrecipPct: json["prob_precip_pct"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "wx_desc": wxDesc,
        "wx_icon": wxIcon,
        "prob_precip_pct": probPrecipPct,
      };
}
