import 'package:flutter/material.dart';
import 'package:sotwo/core/ui/security_keypad/keypad.dart';

class SecurityKeypadTestPage extends StatefulWidget {
  const SecurityKeypadTestPage({super.key});

  @override
  State<SecurityKeypadTestPage> createState() => _SecurityKeypadTestPageState();
}

class _SecurityKeypadTestPageState extends State<SecurityKeypadTestPage> {
  final _controller = SecurityKeypadController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          height: 50,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _controller.isOpened
                    ? _controller.close()
                    : _controller.open(),
                child: const Text('toggle'),
              ),
              SecurityKeypad(
                type: SecurityKeypadType.residentNumber,
                controller: _controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
