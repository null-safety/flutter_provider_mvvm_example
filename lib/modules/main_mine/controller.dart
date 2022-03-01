
import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_example/routers/routers.dart';
import 'package:flutter_provider_mvvm_example/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class MineScreenController extends ChangeNotifier {
  /// 点击登出
  ///
  /// - 清空 UserModel
  /// - 清空页面栈同时跳转到登入页
  void onLogOutTapped(BuildContext context) {
    context.read<UserViewModel>().logout();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouterNames.signIn, (route) => false);
  }
}
