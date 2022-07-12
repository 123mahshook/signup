import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_update_profile_model.dart';
import 'package:signup/app/models/params_models/pm_update_profile_model.dart';

class UpdateProfileService extends BaseService {
  Future<ApiUpdateProfileModel> update(PmUpdateProfileModel params) async {
    ApiUpdateProfileModel res = ApiUpdateProfileModel.initData();
    try {
      res = await appApiRepo.updateProfile(params.toJson());
      if (res.status! && res.actionStatus!) {
        appModel!.customer = res.customer!.first;
      }
    } catch (_) {}
    return res;
  }
}
