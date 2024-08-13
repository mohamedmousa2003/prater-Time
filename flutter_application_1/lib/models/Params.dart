import 'package:flutter_application_1/utils/constractor.dart';

class ParamsName {
   String titleFajr;
   String titleSunrise;
   String titleDhuhr;
   String titleAsr;
   String titleMaghrib;
   String titleIsha;
   String titleImsak;
   String titleMidnight;
   String titleFirsThird;
   String titleLastthird;

  ParamsName({
    required this.titleFajr,
    required this.titleSunrise,
    required this.titleDhuhr,
    required this.titleAsr,
    required this.titleMaghrib,
    required this.titleIsha,
    required this.titleImsak,
    required this.titleMidnight,
    required this.titleFirsThird,
    required this.titleLastthird,
  });
   static List<ParamsName> paramsList = [
    ParamsName(
    titleFajr: fajr, 
    titleSunrise: sunrise,
    titleDhuhr: dhuhr,
    titleAsr: asr,
    titleMaghrib: maghreb,
    titleIsha: isha,
    titleImsak: imsak,
    titleMidnight: midnight,
    titleFirsThird: firsThird,
    titleLastthird: lastthird,
  ),
  
];
}


