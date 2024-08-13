import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/newtwork_layer/api_manager.dart';
import 'package:flutter_application_1/utils/app_colors.dart';
import 'package:intl/intl.dart';

import '../../models/SourceModel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
      ),
      body: FutureBuilder<Data>(
        future: ApiManager.fetchSource(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Something is wrong",
                    style: theme.textTheme.bodyLarge,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(8),
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text(
                        "Try Again",
                        style: theme.textTheme.bodySmall,
                      )),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primary,
              ),
            );
          }
          final timings = snapshot.data!.data.timings;
          final dateFormat24 = DateFormat('HH:mm'); // 24-hour format
          final dateFormat12 = DateFormat('h:mm a'); // 12-hour format

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 300,
                  width: 180,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fajr:", style: theme.textTheme.bodyLarge),
                        const Divider(color: primary, thickness: 2),
                        Text("Sunrise:", style: theme.textTheme.bodyLarge),
                        const Divider(color: primary, thickness: 2),
                        Text("Dhuhr:", style: theme.textTheme.bodyLarge),
                        const Divider(color: primary, thickness: 2),
                        Text("Asr:", style: theme.textTheme.bodyLarge),
                        const Divider(color: primary, thickness: 2),
                        Text("Maghrib:", style: theme.textTheme.bodyLarge),
                        const Divider(color: primary, thickness: 2),
                        Text("Isha:", style: theme.textTheme.bodyLarge),
                      
                      ],
                    ),
                  ),
                  const VerticalDivider(color: primary, thickness: 2),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dateFormat12.format(dateFormat24.parse(timings.fajr)),
                            style: theme.textTheme.bodyLarge),
                        const Divider(color: primary, thickness: 2),
                        Text(
                            dateFormat12
                                .format(dateFormat24.parse(timings.sunrise)),
                            style: theme.textTheme.bodyLarge),
                        const Divider(color: primary, thickness: 2),
                        Text(
                            dateFormat12.format(dateFormat24.parse(timings.dhuhr)),
                            style: theme.textTheme.bodyLarge),
                        const Divider(color: primary, thickness: 2),
                        Text(dateFormat12.format(dateFormat24.parse(timings.asr)),
                            style: theme.textTheme.bodyLarge),
                        const Divider(color: primary, thickness: 2),
                        Text(
                            dateFormat12
                                .format(dateFormat24.parse(timings.maghrib)),
                            style: theme.textTheme.bodyLarge),
                        const Divider(color: primary, thickness: 2),
                        Text(dateFormat12.format(dateFormat24.parse(timings.isha)),
                            style: theme.textTheme.bodyLarge),
                            
                      ],
                    ),
                  ),
                ],
              ),
              
            ),
          );
        },
      ),
    );
  }
}
