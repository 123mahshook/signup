import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_get_member_measurement_model.dart';
import 'package:signup/app/models/params_models/pm_get_questionneire_model.dart';
import 'package:signup/app/services/measurement/set_measurement_service.dart';

class GetMeasurementService extends BaseService {
  Future<ApiGetMemberMeasurementModel> get(
      PmGetQuestionneireUrlModel param) async {
    ApiGetMemberMeasurementModel res = ApiGetMemberMeasurementModel.initData();
    try {
      res = await appApiRepo.getMembershipMeasurementData(param.toJson());
      // res = SetMeasurementService().set(res);
    } catch (_) {}
    return res;
  }
}
