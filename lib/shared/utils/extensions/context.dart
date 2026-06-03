
import 'package:adhd_app/shared/utils/l10n/app_localizations.dart';
import 'package:adhd_app/shared/utils/l10n/app_localizations_en.dart';
import 'package:flutter/material.dart';

extension AppLocalizationExtension on BuildContext {
  static final fallbackLocalization = AppLocalizationsEn();
  AppLocalizations get loc => AppLocalizations.of(this) ?? fallbackLocalization;
} 