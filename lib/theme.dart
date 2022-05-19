import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/log/logger.dart';

class CustomColor {
  static Color font1 = const Color(0xFF1c4776);
  static Color font2 = const Color(0xFF979797);
  static Color font3 = const Color(0xFF00bf7a);
  static Color font4 = const Color(0xFFf88b00);
  static Color font5 = const Color(0xFFeb5160);
  static Color font6 = const Color(0xFF4d13d1);
  static Color font7 = const Color(0xFF000000);
  static Color font8 = const Color(0xFFffffff);
  static Color font9 = const Color(0xFFB71C1C);

  static Color backgroundMain = const Color(0xff1c4776);
  static Color backgroundBase = const Color(0xffffffff);
  static Color backgroundIcon = const Color(0xfff5f9f9);
  static Color backgroundTextBox = const Color(0xfff5f9f9);
  static Color backgroundCard = const Color(0xffffffff);

  static Color icon1 = const Color(0xff1c4776);

  static Color buttonPrimary1Font = const Color(0xffffffff);
  static Color buttonPrimary1Background = const Color(0xff1c4776);
  static Color buttonPrimary2Font = const Color(0xff1c4776);
  static Color buttonPrimary2Background = const Color(0xffffffff);
  static Color buttonSecondary1Font = const Color(0xff1c4776);
  static Color buttonSecondary2Font = const Color(0xffffffff);

  static init(MethodChannel platform) async {
    try {
      Map<String, int>? theme = await platform.invokeMapMethod('getTheme');
      if (theme != null) {
        _initTheme(theme);
      }
    } catch (e) {
      logger(e.toString());
    }
  }

  static _initTheme(Map<String, int> map) async {
    int? font1 = map["font1"];
    if (font1 != null) {
      CustomColor.font1 = Color(font1);
    }
    int? font2 = map["font2"];
    if (font2 != null) {
      CustomColor.font2 = Color(font2);
    }
    int? font3 = map["font3"];
    if (font3 != null) {
      CustomColor.font3 = Color(font3);
    }
    int? font4 = map["font4"];
    if (font4 != null) {
      CustomColor.font4 = Color(font4);
    }
    int? font5 = map["font5"];
    if (font5 != null) {
      CustomColor.font5 = Color(font5);
    }
    int? font6 = map["font6"];
    if (font6 != null) {
      CustomColor.font6 = Color(font6);
    }
    int? font7 = map["font7"];
    if (font7 != null) {
      CustomColor.font7 = Color(font7);
    }
    int? font8 = map["font8"];
    if (font8 != null) {
      CustomColor.font8 = Color(font8);
    }
    int? font9 = map["font9"];
    if (font9 != null) {
      CustomColor.font9 = Color(font9);
    }

    int? backgroundMain = map["backgroundMain"];
    if (backgroundMain != null) {
      CustomColor.backgroundMain = Color(backgroundMain);
    }
    int? backgroundBase = map["backgroundBase"];
    if (backgroundBase != null) {
      CustomColor.backgroundBase = Color(backgroundBase);
    }
    int? backgroundIcon = map["backgroundIcon"];
    if (backgroundIcon != null) {
      CustomColor.backgroundIcon = Color(backgroundIcon);
    }
    int? backgroundCard = map["backgroundIcon"];
    if (backgroundCard != null) {
      CustomColor.backgroundCard = Color(backgroundCard);
    }
    int? backgroundTextBox = map["backgroundTextBox"];
    if (backgroundTextBox != null) {
      CustomColor.backgroundTextBox = Color(backgroundTextBox);
    }

    int? icon1 = map["icon1"];
    if (icon1 != null) {
      CustomColor.icon1 = Color(icon1);
    }

    int? buttonPrimary1Font = map["buttonPrimary1Font"];
    if (buttonPrimary1Font != null) {
      CustomColor.buttonPrimary1Font = Color(buttonPrimary1Font);
    }
    int? buttonPrimary1Background = map["buttonPrimary1Background"];
    if (buttonPrimary1Background != null) {
      CustomColor.buttonPrimary1Background = Color(buttonPrimary1Background);
    }
    int? buttonPrimary2Font = map["buttonPrimary2Font"];
    if (buttonPrimary2Font != null) {
      CustomColor.buttonPrimary2Font = Color(buttonPrimary2Font);
    }
    int? buttonPrimary2Background = map["buttonPrimary2Background"];
    if (buttonPrimary2Background != null) {
      CustomColor.buttonPrimary2Background = Color(buttonPrimary2Background);
    }
    int? buttonSecondary1Font = map["buttonSecondary1Font"];
    if (buttonSecondary1Font != null) {
      CustomColor.buttonSecondary1Font = Color(buttonSecondary1Font);
    }
    int? buttonSecondary2Font = map["buttonSecondary2Font"];
    if (buttonSecondary2Font != null) {
      CustomColor.buttonSecondary2Font = Color(buttonSecondary2Font);
    }
  }
}
