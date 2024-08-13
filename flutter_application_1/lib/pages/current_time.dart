import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_extension.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/utils/app_colors.dart';
import 'package:flutter_application_1/utils/constractor.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class EgyptTime extends StatefulWidget {
  @override
  _EgyptTimeState createState() => _EgyptTimeState();
}

class _EgyptTimeState extends State<EgyptTime> {
  String _timeString = '';

  @override
  void initState() {
    super.initState();
    _getTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now().toUtc().add(Duration(hours: 3));
    final String formattedTime = DateFormat('hh:mm:ss a').format(now);
    setState(() {
      _timeString = formattedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    var local = S.of(context);
    return Row(
      mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Text("${local.clockNow} :",style: theme.textTheme.bodyLarge),
          15.width,
          Text(
            _timeString,style: theme.textTheme.bodyLarge
          ),
        ],
      );
  }
} 