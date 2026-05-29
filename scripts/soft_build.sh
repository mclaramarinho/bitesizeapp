#!/usr/bin/env bash

# ==========================================================================
# FIRST TIME SETUP:
# To make it executable: chmod +x scripts/soft_build.sh
# To create an alias: echo "alias soft-build='bash /path/to/bitesizeapp/scripts/soft_build.sh'" >> ~/.bashrc && source ~/.bashrc
# ==========================================================================

set -euo pipefail

flutter pub get
flutter gen-l10n
flutter pub run build_runner build --delete-conflicting-outputs
