import 'package:flutter_provider_mvvm_example/data/models/license_model.dart';
import 'package:flutter_provider_mvvm_example/data/repositorys/remote/license_api.dart'
    as api;
import 'package:flutter_provider_mvvm_example/view_models/view_model.dart';

/// 菜单权限
class LicenseViewModel extends ViewModel<LicenseModel> {
  LicenseViewModel() : super(later: false);

  @override
  Future<LicenseModel> fetchModel() {
    return api.fetchLicense();
  }
}
