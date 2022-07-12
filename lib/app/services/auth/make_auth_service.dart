import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_make_auth_model.dart';
import 'package:signup/app/models/params_models/pm_make_auth_model.dart';
import 'package:signup/app/services/app/get_home_data_service.dart';

class MakeAuthService extends BaseService {
  Future<ApiMakeAuthModel> auth(PmMakeAuthModel param) async {
    ApiMakeAuthModel res = ApiMakeAuthModel.initData();
    try {
      res = await appApiRepo.makeAuth(param.toJson());
      if (res.status! && res.actionStatus!) {
        await _storeCredentials(res);
        await GetHomeDataService().get();
      }
    } catch (_) {}
    return res;
  }

  _storeCredentials(ApiMakeAuthModel apiRes) async {
    await prefRepo.setUserId(ConvertService.convertString(apiRes.user!.id));
    await prefRepo.setUserTokken(apiRes.accessTokken!);
  }
}
