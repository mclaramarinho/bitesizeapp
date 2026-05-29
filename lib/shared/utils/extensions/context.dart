
import 'package:adhd_app/shared/utils/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension AppLocalizationExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
} 