import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_change_batch_model.dart';
import 'package:signup/app/models/params_models/pm_change_batch_model.dart';
import 'package:signup/app/repositeries/app/membership_repo.dart';

class ChangeBatchService extends BaseService {
  Future<ApiChangeBatchModel> change(PmChangeBatchModel params) async {
    ApiChangeBatchModel res = ApiChangeBatchModel.initData();
    try {
      res = await appApiRepo.changeBatchApi(params.toJson());
      print("-----------");
      print(res.toJson());
      print("-----------");
      if (res.status! && res.actionStatus!) {
        MembershipRepo().updateRow(res.membership!);
      }
    } catch (_) {}
    return res;
  }
}
