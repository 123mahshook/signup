import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_get_membership_model.dart';
import 'package:signup/app/models/params_models/pm_insert_freeze_model.dart';
import 'package:signup/app/repositeries/app/membership_repo.dart';

class UnFreezeMembershipService extends BaseService {
  Future<ApiGetMembershipModel> unFreeze(PmInsertFreezeModel param) async {
    ApiGetMembershipModel res = ApiGetMembershipModel.initData();
    try {
      res = await appApiRepo.unFreezeMembership(param.toJsonUnFreeze());
      if (res.status! && res.actionStatus!) {
        MembershipRepo().insertData(res.membership!);
      }
    } catch (_) {}
    return res;
  }
}
