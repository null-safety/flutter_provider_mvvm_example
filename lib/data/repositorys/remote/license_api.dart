import 'dart:math';

import 'package:flutter_provider_mvvm_example/data/models/license_model.dart';

/// 通过调用 api 获取 [LicenseModel]
///
/// - 服务器异常时，返回
Future<LicenseModel> fetchLicense() async {
  /// 模拟 api 调用延迟
  await Future.delayed(Duration(milliseconds: 3000 + Random().nextInt(2000)));

  // throw ServerBombException();

  /// 模拟数据请求成功
  return const LicenseModel(['首页', '列表', '我的', '...'], {});
}
