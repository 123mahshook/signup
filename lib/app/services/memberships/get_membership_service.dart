import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_get_membership_model.dart';
import 'package:signup/app/models/params_models/pm_load_more_model.dart';
import 'package:signup/app/repositeries/app/membership_repo.dart';

class GetMembershipService extends BaseService {
  Future<ApiGetMembershipModel> get(PmLoadMoreModel params) async {
    ApiGetMembershipModel res = ApiGetMembershipModel.initData();
    try {
      res = await appApiRepo.getMembershipData(params.toJson());
      if (res.status! && res.actionStatus!) {
        MembershipRepo().insertData(res.membership!);
      }
    } catch (_) {}
    return res;
  }
}
