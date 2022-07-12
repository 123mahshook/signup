import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_get_questionniere_model.dart';
import 'package:signup/app/models/params_models/pm_get_questionneire_model.dart';

class GetCustomerQuestionneireService extends BaseService {
  Future<ApiGetQuestionniereModel> get(PmGetQuestionneireUrlModel param) async {
    ApiGetQuestionniereModel res = ApiGetQuestionniereModel.initData();
    try {
      res = await appApiRepo.getCustomerQuestionneireUrl(param.toJson());
    } catch (_) {}
    return res;
  }
}
