#!/usr/bin/env bash
PARENT_FEATURE_NAME=$2
FEATURE_NAME=$1

# determine script directory and project root (works regardless of CWD)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR/.."

# go to root of project
cd "$PROJECT_ROOT"

# if no feature name is provided, exit with error
if [ -z "$FEATURE_NAME" ]; then
  echo "Error: No feature name provided."
  echo "Usage: create-feature <feature_name> [parent_feature_name]"
  exit 1
fi

# ensure feature name does not contain spaces and uses snake_case (feature_name) - exit with error and instruction if not correct
# reject names with whitespace
if [[ "$FEATURE_NAME" =~ [[:space:]] ]]; then
  echo "Error: feature name must not contain spaces. Use snake_case (e.g. feature_name)."
  echo "Usage: create-feature <feature_name> [parent_feature_name]"
  exit 1
fi

# enforce snake_case: only lower-case letters, digits and underscores
if ! [[ "$FEATURE_NAME" =~ ^[a-z0-9_]+$ ]]; then
  echo "Error: feature name must be lowercase snake_case (letters a-z, digits 0-9 and underscores)."
  echo "Example: sign_in"
  echo "Usage: create-feature <feature_name> [parent_feature_name]"
  exit 1
fi

# validate parent feature name if provided
if [ -n "$PARENT_FEATURE_NAME" ]; then
  if [[ "$PARENT_FEATURE_NAME" =~ [[:space:]] ]]; then
    echo "Error: parent feature name must not contain spaces. Use snake_case (e.g. parent_feature)."
    exit 1
  fi
  if ! [[ "$PARENT_FEATURE_NAME" =~ ^[a-z0-9_]+$ ]]; then
    echo "Error: parent feature name must be lowercase snake_case (letters a-z, digits 0-9 and underscores)."
    exit 1
  fi
fi

# if parent feature name is provided, create the feature inside the parent feature
if [ -n "$PARENT_FEATURE_NAME" ]; then
  mkdir -p "lib/features/$PARENT_FEATURE_NAME/$FEATURE_NAME"
  cd "lib/features/$PARENT_FEATURE_NAME/$FEATURE_NAME"
else
  mkdir -p "lib/features/$FEATURE_NAME"
  cd "lib/features/$FEATURE_NAME"
fi

# create folders
## Data layer
mkdir -p data

### Datasources
mkdir -p data/datasources

#### Remote (API, Firebase, etc.)
mkdir -p data/datasources/remote

#### Local (SQLite, SharedPreferences, etc.)
mkdir -p data/datasources/local

### Models (for data transactions in datasources)
mkdir -p data/models

### Repositories
mkdir -p data/repositories

## Domain layer
mkdir -p domain
mkdir -p domain/entities
mkdir -p domain/repositories
mkdir -p domain/use_cases

## Presentation layer
mkdir -p presentation

### Cubit and state
mkdir -p presentation/cubit
touch "presentation/cubit/${FEATURE_NAME}_cubit.dart"
touch "presentation/cubit/${FEATURE_NAME}_state.dart"

### Pages
mkdir -p presentation/pages
touch "presentation/pages/${FEATURE_NAME}_page.dart"

### Widgets exclusive to the feature
mkdir -p presentation/widgets

echo "Feature '$FEATURE_NAME' created successfully!"

# Suggest next steps
echo "Next steps:"
# create route in routes.dart
echo "1. Add a route for the new feature in lib/shared/utils/navigation/routes.dart"