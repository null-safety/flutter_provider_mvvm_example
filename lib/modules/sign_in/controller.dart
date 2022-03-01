import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_example/commons/widgets/global_indicator.dart';
import 'package:flutter_provider_mvvm_example/routers/routers.dart';
import 'package:flutter_provider_mvvm_example/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class SignInViewController extends ChangeNotifier {
  /// 用户名
  final userName = TextEditingController();

  /// 短信验证码
  final smsCode = TextEditingController();

  /// 登入
  Future<void> signIn(BuildContext context, bool Function() mounted) async {
    final indicator = showGlobalIndicator(context: context);

    // TODO: catch excaptions
    await context.read<UserViewModel>().login(userName.text, smsCode.text);

    indicator.dismiss();

    if (!mounted()) return;
    // ignore: use_build_context_synchronously
    Navigator.of(context)
        .pushNamedAndRemoveUntil(RouterNames.main, (route) => false);
  }
}
