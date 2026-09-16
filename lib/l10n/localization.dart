import 'package:SocialLib/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('fa', 'IR'),
    const Locale('ar'),
    const Locale('ps'),
  ];
}

class Localization {
  static final Localization _instance = Localization._internal();
  static AppLocalizations? _current;
  static AppLocalizations get tr => _current!;

  Localization._internal();

  factory Localization() => _instance;

  static Future<AppLocalizations> loadCurrent() async {
    if (_current == null) {
      final parts = Intl.getCurrentLocale().split('_');
      final locale = Locale(parts.first, parts.last);
      _current = await AppLocalizations.delegate.load(locale);
    }
    return Future.value(_current);
  }

  static Future<AppLocalizations> setCurrent(Locale loc) async {
    _current = await AppLocalizations.delegate.load(loc);
    return Future.value(_current);
  }

  void invalidate() {
    _current = null;
  }
}
