import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sotwo/feature/route/router.dart';
import 'package:sotwo/core/security/program.dart';
import 'package:url_launcher/url_launcher.dart';

class Vguard implements SecurityProgram {
  static const _methodChannel = MethodChannel('com.sablue.sotwo.vguard');

  @override
  void initialize() {
    _startListen();
  }

  @override
  void onResumed() {
    isRunning().then((running) {
      if (running) {
        return;
      }
      start();
    });
  }

  @override
  Future<void> start() async {
    if (await isRunning()) {
      return;
    }

    try {
      final resultCode = _StartResultCode.fromCode(
        await _methodChannel.invokeMethod('start'),
      );

      switch (resultCode) {
        case _StartResultCode.succeeded:
          break;
        case _StartResultCode.programNotInstalled:
          _showNeedProgramInstallDialog();

        default:
          throw _StartResultCodeException(resultCode);
      }
    } catch (e) {
      // TODO : 로거 추가되면 적용
      return;
    }
  }

  @override
  Future<bool> isRunning() async {
    try {
      return await _methodChannel.invokeMethod('isRunning');
    } catch (e) {
      // TODO : 로거 추가되면 적용
      return false;
    }
  }

  void _startListen() {
    _methodChannel.setMethodCallHandler(
      (call) async {
        switch (call.method) {
          case 'onMalwareDetected':
            _onMalwareDetected();
          case 'onRootingDetected':
            _onRootingDetected();
          case 'onRemoteWareDetected':
            _onRemoteWareDetected();
          default:
            break;
        }
        return;
      },
    );
  }

  void _onMalwareDetected() {}
  void _onRootingDetected() {}
  void _onRemoteWareDetected() {}
  void _showNeedProgramInstallDialog() {
    // TODO : 다이얼로그 디자인 추가되면 적용
    final context = rootNavigatorKey.currentContext;
    if (context?.mounted ?? false) {
      showDialog(
        context: context!,
        builder: (context) {
          return AlertDialog(
            title: const Text('V-Guard 설치 필요'),
            content: const Text('V-Guard를 설치해야 합니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  _toProgramInstallPage();
                  context.pop();
                },
                child: const Text('설치'),
              ),
            ],
          );
        },
      );
    } else {
      _toProgramInstallPage();
    }
  }

  /// [launchUrl] 성공 여부 반환
  Future<bool> _toProgramInstallPage() async {
    try {
      return launchUrl(
        Uri.parse('market://details?id=com.polarisoffice.vguardsecuone'),
      );
    } catch (e) {
      return false;
    }
  }
}

enum _StartResultCode {
  succeeded(200),
  contextNull(102),
  programNotInstalled(103),
  licenseKeyInvalid(105),
  licenseKeyNotFound(106),
  licenseKeyExpired(108),
  licenseKeyOverUsed(109),
  licenseKeyWrong(110),
  ;

  final int code;
  const _StartResultCode(this.code);

  static _StartResultCode? fromCode(final int code) {
    return _StartResultCode.values.firstWhereOrNull((e) => e.code == code);
  }
}

class _StartResultCodeException implements Exception {
  final _StartResultCode? resultCode;
  const _StartResultCodeException(this.resultCode);
}
