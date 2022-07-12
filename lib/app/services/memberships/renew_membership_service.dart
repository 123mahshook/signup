import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/params_models/pm_renew_membership_model.dart';
import 'package:signup/app/repositeries/app/membership_repo.dart';

import '../../models/api_models/api_renew_membership_model.dart';

class RenewMembershipService extends BaseService {
  Future<ApiRenewMembershipModel> renew(PmRenewMembershipModel params) async {
    ApiRenewMembershipModel res = ApiRenewMembershipModel.initData();
    try {
      res = await appApiRepo.renewMembershipApi(params.toJson());
      if (res.status! && res.actionStatus!) {
        MembershipRepo().updateRow(res.membership!);
      }
    } catch (_) {}
    return res;
  }
}
