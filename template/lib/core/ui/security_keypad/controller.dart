part of 'keypad.dart';

class SecurityKeypadController {
  final inputLength = ValueNotifier(0);
  final encryptedInput = ValueNotifier('');
  final _isOpened = ValueNotifier(false);

  SecurityKeypadController();

  bool get isOpened => _isOpened.value;

  void open() {
    _isOpened.value = true;
  }

  void close() {
    _isOpened.value = false;
  }
}
