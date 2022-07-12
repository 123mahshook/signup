import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_get_home_data_model.dart';
import 'package:signup/app/services/app/get_home_data_service.dart';
import 'package:signup/core/models/api_models/api_action_status_message.dart';
import 'package:signup/core/repositeries/preference/preference_repo.dart';

class CheckAuthService extends BaseService {
  Future<ApiActionStatusMessageModel> check() async {
    ApiActionStatusMessageModel finalRes =
        ApiActionStatusMessageModel.loadInit();
    try {
      String tokken = await PreferenceRepo().getUserTokken();
      String userId = await PreferenceRepo().getUserId();
      if (tokken != "" && userId != "") {
        ApiGetHomeDataModel apiRes = await GetHomeDataService().get();
        finalRes = apiRes.loadActionStatus();
      } else {
        await Future.delayed(const Duration(seconds: 3));
      }
    } catch (_) {}
    return finalRes;
  }
}
