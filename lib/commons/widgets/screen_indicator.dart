import 'package:flutter/material.dart';

/// 页面中心的加载指示器
///
/// 一个居中的 [CircularProgressIndicator]
class ScreenIndicator extends StatelessWidget {
  const ScreenIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
