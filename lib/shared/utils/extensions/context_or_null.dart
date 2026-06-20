import 'package:adhd_app/shared/utils/l10n/app_localizations.dart';
import 'package:adhd_app/shared/utils/l10n/app_localizations_en.dart';
import 'package:flutter/material.dart';

// TODO (docs)
extension AppLocalizationExtension on BuildContext? {
  static final AppLocalizations fallbackLocalization = AppLocalizationsEn();
  AppLocalizations get loc => this == null
      ? fallbackLocalization
      : AppLocalizations.of(this!) ?? fallbackLocalization;
}
