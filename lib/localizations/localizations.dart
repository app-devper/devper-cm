import 'package:flutter/material.dart';

class CommonLocalizations {
  CommonLocalizations(this.locale);

  final Locale locale;

  static CommonLocalizations of(BuildContext context) {
    return Localizations.of<CommonLocalizations>(context, CommonLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'th': {
      'core_dialog_error_title': 'พบข้อผิดพลาด',
      'core_dialog_warning_title': 'แจ้งเตือน',
      'core_button_ok': 'ตกลง',
      'core_button_cancel': 'ยกเลิก',
      'core_button_confirm': 'ยืนยัน',
      'core_loading': 'กำลังดำเนินการ..',
      'core_view_close': 'ปิด',
    },
    'en': {
      'core_dialog_error_title': 'Error',
      'core_dialog_warning_title': 'Warning',
      'core_button_ok': 'OK',
      'core_button_cancel': 'Cancel',
      'core_button_confirm': 'Confirm',
      'core_loading': 'Loading..',
      'core_view_close': 'Close',
    },
  };

  static List<String> languages() => _localizedValues.keys.toList();

  String get closeBtn {
    return _localizedValues[locale.languageCode]!['core_view_close']!;
  }

  String get okBtn {
    return _localizedValues[locale.languageCode]!['core_button_ok']!;
  }

  String get confirmBtn {
    return _localizedValues[locale.languageCode]!['core_button_confirm']!;
  }

  String get cancelBtn {
    return _localizedValues[locale.languageCode]!['core_button_cancel']!;
  }

  String get loading {
    return _localizedValues[locale.languageCode]!['core_loading']!;
  }

  String get errorTitle {
    return _localizedValues[locale.languageCode]!['core_dialog_error_title']!;
  }

  String get warningTitle {
    return _localizedValues[locale.languageCode]!['core_dialog_warning_title']!;
  }
}
