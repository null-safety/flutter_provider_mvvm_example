import 'dart:math';

import 'package:flutter_provider_mvvm_example/data/models/user_model.dart';

Future<UserModel> register(Map<String, dynamic> params) async {
  /// 模拟 api 调用延迟
  await Future.delayed(Duration(milliseconds: Random().nextInt(500)));

  // throw ApiException('该号码已注册！', '2');
  // throw ApiException('服务器抽风！', '1');
  // throw '其他错误！';

  /// 模拟数据请求成功
  return UserModel('${params['nickName'] ?? '无名氏'}', '${params['phone']}');
}

Future<UserModel> login(Map<String, dynamic> params) async {
  /// 模拟 api 调用延迟
  await Future.delayed(Duration(milliseconds: Random().nextInt(500)));

  // throw ApiException('该号码已注册！', '2');
  // throw ServerBombException();
  // throw '其他错误！';

  /// 模拟数据请求成功
  return UserModel('${params['nickName'] ?? '无名氏'}', '${params['phone']}');
}
