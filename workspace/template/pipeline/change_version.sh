#!/bin/bash

sed -i '' "/version: */ c\\
version: $APP_VERSION+$APP_BUILD_NUMBER
" ./pubspec.yaml
