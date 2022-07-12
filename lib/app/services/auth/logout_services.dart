import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/core/models/api_models/api_action_status_message.dart';
import 'package:signup/core/models/api_models/api_status_message.dart';

class LogoutService extends BaseService {
  Future<ApiStatusMessageModel> logoutData() async {
    ApiStatusMessageModel ret =
        ApiStatusMessageModel(message: "", status: true);
    try {
      ApiActionStatusMessageModel res = await appApiRepo.logout();
      if (res.status! && res.actionStatus!) {
        await _mnLogoutUserMeta();
      }
      ret.status = res.actionStatus!;
      ret.message = res.message!;
    } catch (e) {}
    return ret;
  }

  /* Main Logout data */
  Future<void> _mnLogoutUserMeta() async {
    await prefRepo.setUserTokken("");
  }
}
