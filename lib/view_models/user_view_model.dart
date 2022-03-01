import 'dart:math';

import 'package:flutter_provider_mvvm_example/data/models/user_model.dart';
import 'package:flutter_provider_mvvm_example/data/repositorys/remote/user_api.dart'
    as api;
import 'package:flutter_provider_mvvm_example/view_models/view_model.dart';

class UserViewModel extends ViewModel<UserModel> {
  UserViewModel() : super(later: true);

  /// 注册
  Future<void> register(String phone, String smsCode) async {
    /// 模拟 api 调用
    model = await api.register({
      'phone': phone,
      'smsCode': smsCode,
    });
  }

  /// 登入
  Future<void> login(String userName, String passWord) async {
    /// 模拟 api 调用
    await Future.delayed(Duration(milliseconds: 2000 + Random().nextInt(500)));

    model = const UserModel('张三', '13303330333');
  }

  /// 登出
  Future<void> logout() async {
    clearModel();

    /// 模拟 api 调用
    await Future.delayed(Duration(milliseconds: Random().nextInt(500)));
  }

  @override
  Future<UserModel> fetchModel() {
    // TODO: 从缓存获取 Model
    throw UnimplementedError();
  }
}
