import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_get_feedback_url_model.dart';
import 'package:signup/app/models/params_models/pm_get_questionneire_model.dart';

class GetQuestionneireUrlService extends BaseService {
  Future<ApiGetFeedbackModel> get(PmGetQuestionneireUrlModel param) async {
    ApiGetFeedbackModel res = ApiGetFeedbackModel.initData();
    try {
      res = await appApiRepo.getQuestionneireUrl(param.toJson());
    } catch (_) {}
    return res;
  }
}
