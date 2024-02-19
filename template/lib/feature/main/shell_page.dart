import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sotwo/core/firebase/fcm/manager.dart';

class MainShellPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainShellPage({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  @override
  void initState() {
    super.initState();

    // TODO : 로그인 이후에 호출
    FcmManager.onLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Colors.red,
          splashColor: Colors.blue,
          // splashFactory: InkSparkle.splashFactory,
        ),
        child: BottomNavigationBar(
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.navigationShell.currentIndex,
          // backgroundColor: Colors.black,
          selectedItemColor: Colors.yellow,
          useLegacyColorScheme: false,
          unselectedItemColor: Colors.green,
          elevation: 5,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.content_copy),
              label: 'content',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.gamepad),
              label: 'game',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'my',
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    final currentIndex = widget.navigationShell.currentIndex;
    if (currentIndex == index) {
      return;
    }
    widget.navigationShell.goBranch(index);
  }
}
