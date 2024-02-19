import 'package:flutter/services.dart';
import 'package:sotwo/core/security/program.dart';

class Liapp implements SecurityProgram {
  static const _channel = MethodChannel('com.sablue.sotwo.liapp');

  @override
  void initialize() {
    // TODO: implement initialize
  }

  @override
  Future<bool> isRunning() {
    // TODO: implement isRunning
    throw UnimplementedError();
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  @override
  Future<void> start() {
    // TODO: implement start
    throw UnimplementedError();
  }
}
