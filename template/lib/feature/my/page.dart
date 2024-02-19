import 'package:flutter/material.dart';
import 'package:sotwo/feature/route/route.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my'),
        actions: [
          IconButton(
            onPressed: () {
              SabRoute.menu.go(context);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Center(
        child: Text('my'),
      ),
    );
  }
}
