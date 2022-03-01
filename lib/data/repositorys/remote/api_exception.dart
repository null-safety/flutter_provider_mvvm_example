/// 定义所有与接口调用异常相关的抽象接口。
///
/// 为了能在编写业务代码时更精确的捕获与处理异常，建议为每种异常都创建一个实现。
abstract class ApiException implements Exception {
  factory ApiException(String message, [String? errCode]) {
    return _ApiException(message, errCode);
  }
}

/// [ApiException] 的默认实现。
class _ApiException implements ApiException {
  final String message;

  final String? _errCode;

  _ApiException(this.message, this._errCode);

  String get errCode => _errCode ?? 'undefined';
}

/// 服务器炸了
class ServerBombException implements ApiException {
  final String message = '服务器炸了！';

  final String errCode = '1';
}
