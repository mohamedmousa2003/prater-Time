import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/l10n.dart';
import 'package:flutter_application_1/pages/current_time.dart';
import 'package:flutter_application_1/pages/home/home_view.dart';
import 'package:flutter_application_1/pages/home/widget/name.dart';
import 'package:flutter_application_1/pages/splash/splash_view.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("en"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.themeLight,
      home: Name(),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';

  // ar return true 
  // en return false
}
