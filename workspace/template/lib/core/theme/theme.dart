import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
part 'button_theme.dart';
part 'text_theme.dart';
part 'color_theme.dart';

extension ThemeBuildContext on BuildContext {
  ThemeData get theme => Theme.of(this);
}

class SabTheme {
  const SabTheme._();

  static const _defaultFontFamily = 'Pretendard';

  static ThemeData getLightTheme(final BuildContext context) =>
      Theme.of(context).copyWith(
        textTheme: context.theme.textTheme.apply(
          fontFamily: _defaultFontFamily,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: SabColorTheme.black1,
        ),
        scaffoldBackgroundColor: SabColorTheme.white1,
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          backgroundColor: SabColorTheme.white1,
        ),
        listTileTheme: ListTileTheme.of(context).copyWith(
          contentPadding: EdgeInsets.zero,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          titleTextStyle: SabTextTheme.semantic.appBarTitle1,
          elevation: 0.0,
          titleSpacing: 0.0,
          toolbarHeight: 50.0,
          centerTitle: true,
          backgroundColor: SabColorTheme.white1,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
        ),
      );
}
