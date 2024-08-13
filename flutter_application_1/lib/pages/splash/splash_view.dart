import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_extension.dart';
import 'package:flutter_application_1/utils/app_colors.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String routeName = "splash";
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    Timer(const Duration(seconds: 3), () {
      //Navigator
      //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Scaffold(
      body: Stack(
        children: [
           Image.asset(
             "assets/splash.jpeg",
             width: double.infinity,
             height: double.infinity,
             fit: BoxFit.fill,
           ),
           10.height,
           Align(
            alignment: Alignment.center,
             child: DefaultTextStyle(
               style: const TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
                 color: primary,
               ),
               child: AnimatedTextKit(
                 animatedTexts: [
                   WavyAnimatedText('ＰＲＡＹＥＲ  ＴＩＭＥＳ'),
                 ],
                 isRepeatingAnimation: true,
               ),
             ),
           ),
          
        
        ],
      ),
    );
  }
}
