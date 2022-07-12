import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_check_measurement_model.dart';
import 'package:signup/app/models/params_models/pm_check_measurement_model.dart';

class CheckMeasurementService extends BaseService {
  Future<ApiCheckMeasurementData> check(PmCheckMeasurementModel params) async {
    ApiCheckMeasurementData res = ApiCheckMeasurementData.initData();
    try {
      res = await appApiRepo.checkMemberMeasurementData(params.toJson());
    } catch (_) {}
    return res;
  }
}
