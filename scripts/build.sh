#!/usr/bin/env bash

# ==========================================================================
# FIRST TIME SETUP:
# To make it executable: chmod +x scripts/build.sh
# To create an alias: echo "alias build='bash /path/to/bitesizeapp/scripts/build.sh'" >> ~/.bashrc && source ~/.bashrc
# ==========================================================================

set -euo pipefail

flutter clean
flutter pub get
flutter gen-l10n
rm -rf ./firebase.json
flutterfire configure -f --out=lib/shared/firebase/firebase_options.dart --platforms=android,ios
flutter pub run build_runner build --delete-conflicting-outputs
