import 'dart:math' as math;

import 'package:flutter/material.dart';

class ColorUtils {
  static Color getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(0.5);
  }
}
