import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class LocaleState extends StateNotifier<Locale> {
  LocaleState(String lang) : super(Locale(lang));

  void setLocale(Locale loc) {
    state = loc;
    Localization.setCurrent(loc);
  }
}

final localeStateProvider = StateNotifierProvider<LocaleState, Locale>((ref) {
  return LocaleState('fa');
});

// class LocaleNotifier extends ChangeNotifier {
//   final Ref _ref;

//   LocaleNotifier(this._ref) {
//     _ref.listen<Locale>(
//       localeStateProvider,
//       (_, __) => notifyListeners(),
//     );
//   }
// }
