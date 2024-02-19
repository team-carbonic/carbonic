import 'package:flutter/material.dart';
import 'package:sotwo/feature/route/route.dart';

class TestMainPage extends StatefulWidget {
  const TestMainPage({super.key});

  @override
  State<TestMainPage> createState() => _TestMainPageState();
}

class _TestMainPageState extends State<TestMainPage> {
  @override
  Widget build(BuildContext context) => Material(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Button(
                text: '김학현',
                onPressed: () {
                  SabRoute.testKhh.go(context);
                },
              ),
              _Button(
                text: '김우진',
                onPressed: () {
                  SabRoute.testGwj.go(context);
                },
              ),
            ],
          ),
        ),
      );
}

class _Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const _Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 25.0,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
