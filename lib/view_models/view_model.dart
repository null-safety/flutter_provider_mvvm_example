import 'package:flutter/material.dart';

abstract class ViewModel<T> extends ChangeNotifier {
  /// [ViewModel] 的模板构造函数
  ///
  /// 当 [later] 为 `false` 时则会立即执行 [fetchModel]，
  /// 在其返回结果后将结果赋值给 [_model]，并调用 [notifyListeners]。
  ///
  /// 另一个好处是，当超类的构造函数有必传参时，编译器会提示子类必须在构造函数中调用 `super()`，
  /// 从而避免编写代码时忘记调用 `super()`
  ViewModel({required bool later}) {
    if (later) return;
    debugPrint('$runtimeType');
    fetchModel().then((value) {
      _model = value;
      notifyListeners();
    });
  }

  T? _model;

  T get model {
    assert(_model != null, '引发这个错误是因为 model 还没有准备好，确保 [fetchModel] 已完成调用！');
    return _model!;
  }

  set model(T newValue) {
    _model = newValue;
    notifyListeners();
  }

  /// 清空 Model
  void clearModel() {
    _model = null;
    notifyListeners();
  }

  bool get hasModel => _model != null;

  /// 获取 [T] 类型的 `Model`。
  Future<T> fetchModel();
}
