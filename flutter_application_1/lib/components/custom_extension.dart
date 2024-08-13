import 'package:flutter/material.dart';
// SizeBox
extension View on num {
  Widget get height => SizedBox(height: toDouble());

  Widget get width => SizedBox(width: toDouble());
}