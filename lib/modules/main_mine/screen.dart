import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_example/modules/main_mine/controller.dart';

/// 主页-Home
class MineScreen extends StatefulWidget {
  const MineScreen({Key? key}) : super(key: key);

  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  final controller = MineScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => controller.onLogOutTapped(context),
          child: const Text('退出登录'),
        ),
      ),
    );
  }
}
