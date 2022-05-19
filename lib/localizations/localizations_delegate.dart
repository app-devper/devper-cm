import 'package:common/localizations/localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CommonLocalizationsDelegate extends LocalizationsDelegate<CommonLocalizations> {

  @override
  bool isSupported(Locale locale) => CommonLocalizations.languages().contains(locale.languageCode);

  @override
  Future<CommonLocalizations> load(Locale locale) => _load(locale);

  static Future<CommonLocalizations> _load(Locale locale ) {
    return SynchronousFuture<CommonLocalizations>(CommonLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<CommonLocalizations> old) => false;
}
