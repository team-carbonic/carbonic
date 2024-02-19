import 'dart:io';

import 'package:sotwo/core/config/flavor.dart';
import 'package:sotwo/core/security/platform/liapp.dart';
import 'package:sotwo/core/security/platform/vguard.dart';

abstract class SecurityProgram {
  static bool get needSecurityProgram => F.flavor.isLive;

  static final SecurityProgram _instance =
      Platform.isAndroid ? Vguard() : Liapp();

  factory SecurityProgram() => _instance;

  void initialize();

  Future<void> start();
  Future<bool> isRunning();

  void onResumed();
}
