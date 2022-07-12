import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/params_models/pm_update_pacer_app_status_model.dart';
import 'package:signup/app/repositeries/app/membership_repo.dart';
import 'package:signup/core/models/api_models/api_action_status_message.dart';

class UpdateCustomerPacerAppStatusService extends BaseService {
  Future<ApiActionStatusMessageModel> get(
      PmUpdatePacerAppStatusModel param) async {
    ApiActionStatusMessageModel res = ApiActionStatusMessageModel.loadInit();
    try {
      res = await appApiRepo.customerUpdatePacerAppStatusApi(param.toJson());
      if (res.status! && res.actionStatus!) {
        int customrId = ConvertService.convertInt(param.customer!);
        bool paceSts = ConvertService.convertBoolInt(param.status);
        MembershipRepo().insertPacerStatusById(customrId, paceSts);
      }
    } catch (_) {}
    return res;
  }
}
