import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/models/member_measurement_model.dart';
import 'package:signup/app/models/params_models/pm_insert_measurement_model.dart';
import 'package:signup/core/models/api_models/api_action_status_message.dart';

class InsertMeasurementService extends BaseService {
  Future<ApiActionStatusMessageModel> insert(
      PmInsertMeasurementModel params) async {
    ApiActionStatusMessageModel res = ApiActionStatusMessageModel(
        status: true, actionStatus: false, message: "");
    try {
      res = await appApiRepo.insertMembershipMeasurementData(params.toJson());
    } catch (_) {}
    return res;
  }
}
//MemberMeasurementModel
//params.toJsonInsert()