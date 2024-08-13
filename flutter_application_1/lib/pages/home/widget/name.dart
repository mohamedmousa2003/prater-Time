import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_extension.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/newtwork_layer/api_manager.dart';
import 'package:flutter_application_1/pages/current_time.dart';
import 'package:flutter_application_1/pages/home/widget/language.dart';
import 'package:flutter_application_1/utils/app_colors.dart';
import 'package:flutter_application_1/utils/constractor.dart';
import 'package:intl/intl.dart';

class Name extends StatefulWidget {
  Name({super.key});

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  String isSelected = english;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local = S.of(context);
    var locale = Localizations.localeOf(context);  // Get the locale

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              borderRadius: BorderRadius.circular(10),
              dropdownColor: primary,
              underline: SizedBox(),
              onChanged: (lang) {
                if (lang == english) {
                  isSelected = local.english;
                } else {
                  isSelected = local.arabic;
                }
                setState(() {});
              },
              // value: isSelected,
              items: [english, arabic]
                  .map((e) => DropdownMenuItem(
                        child: Text(
                          e,
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(fontSize: 20),
                        ),
                        value: e,
                      ))
                  .toList(),
              icon: Row(
                children: [
                  Icon(
                    Icons.language,
                    color: white,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: white,
                  ),
                ],
              ),
            ),
          )
        ],
        backgroundColor: primary,
        centerTitle: true,
        title: Text(
          local.praterTime,
          style: theme.textTheme.bodyMedium,
        ),
      ),
      body: FutureBuilder(
        future: ApiManager.fetchSource(), // استبدل بـ API الخاص بك لجلب البيانات
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong!"));
          }

          final timings = snapshot.data!.data.timings;

          // Initialize the date formatters based on the locale
          final DateFormat dateFormat24=DateFormat('HH:mm'); // 24-hour format
          final DateFormat dateFormat12 = DateFormat('h:mm a');// 12-hour format
          

          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  20.height,
                  Text(snapshot.data!.data.date.gregorian.date,
                      style: theme.textTheme.bodyLarge),
                  Text(snapshot.data!.data.date.gregorian.month.en,
                      style: theme.textTheme.bodyLarge),
                  Text(snapshot.data!.data.date.hijri.date,
                      style: theme.textTheme.bodyLarge),
                  Text(snapshot.data!.data.date.hijri.month.en,
                      style: theme.textTheme.bodyLarge),
                  Text(snapshot.data!.data.date.hijri.weekday.en,
                      style: theme.textTheme.bodyLarge),
                  Text(snapshot.data!.data.date.hijri.year,
                      style: theme.textTheme.bodyLarge),
                  Text(snapshot.data!.data.date.readable,
                      style: theme.textTheme.bodyLarge),
                  Text(snapshot.data!.data.meta.timezone,
                      style: theme.textTheme.bodyLarge),
                  EgyptTime(),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        CustomRow(
                            textName: local.fajr,
                            time: dateFormat12
                                .format(dateFormat24.parse(timings.fajr)),
                            icon: Icons.nights_stay_sharp),
                        CustomRow(
                            textName: local.sunrise,
                            time: dateFormat12.format(
                                dateFormat24.parse(timings.sunrise)),
                            icon: Icons.alarm),
                        CustomRow(
                            textName: local.dhuhr,
                            time: dateFormat12
                                .format(dateFormat24.parse(timings.dhuhr)),
                            icon: Icons.alarm),
                        CustomRow(
                            textName: local.asr,
                            time: dateFormat12
                                .format(dateFormat24.parse(timings.asr)),
                            icon: Icons.alarm),
                        CustomRow(
                            textName: local.maghreb,
                            time: dateFormat12.format(
                                dateFormat24.parse(timings.maghrib)),
                            icon: Icons.alarm),
                        CustomRow(
                            textName: local.isha,
                            time: dateFormat12
                                .format(dateFormat24.parse(timings.isha)),
                            icon: Icons.nights_stay_sharp),
                        CustomRow(
                            textName: local.firstThird,
                            time: dateFormat12.format(
                                dateFormat24.parse(timings.firstthird)),
                            icon: Icons.nights_stay_sharp),
                        CustomRow(
                            textName: local.midnight,
                            time: dateFormat12.format(
                                dateFormat24.parse(timings.midnight)),
                            icon: Icons.nights_stay_sharp),
                        CustomRow(
                            textName: local.lastThird,
                            time: dateFormat12.format(
                                dateFormat24.parse(timings.lastthird)),
                            icon: Icons.nights_stay_sharp),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomRow extends StatelessWidget {
  CustomRow(
      {super.key,
      required this.textName,
      required this.time,
      required this.icon});
  String textName;
  IconData icon;
  String time;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        10.width,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                textName,
                style: theme.textTheme.bodyLarge,
              ),
              Text(
                time,
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        const Divider(
          color: primary,
          thickness: 1,
        ),
      ],
    );
  }
}
