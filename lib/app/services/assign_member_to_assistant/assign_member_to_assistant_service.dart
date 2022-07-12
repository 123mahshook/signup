import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_assign_member_to_assistant_model.dart';
import 'package:signup/app/models/params_models/pm_assign_member_to_assistant_model.dart';
import 'package:signup/app/repositeries/app/membership_repo.dart';

class AssignMemberToAssistantService extends BaseService {
  Future<ApiAssignMembertoAssistantModel> assign(
      PmAssignMemberToAssistantModel params) async {
    ApiAssignMembertoAssistantModel res =
        ApiAssignMembertoAssistantModel.initData();
    try {
      res = await appApiRepo.assignMemberToAssistantApi(params.toJson());
      if (res.status! && res.actionStatus!) {
        MembershipRepo().updateRow(res.membership!);
      }
    } catch (_) {}
    return res;
  }
}
