import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_get_ratings_model.dart';
import 'package:signup/app/models/params_models/pm_load_more_model.dart';
import 'package:signup/app/repositeries/app/ratings_repo.dart';

class GetRatingsService extends BaseService {
  Future<ApiGetRatingsModel> get(PmLoadMoreModel params) async {
    ApiGetRatingsModel res = ApiGetRatingsModel.initData();
    try {
      res = await appApiRepo.getRatingsData(params.toJson());
      if (res.status! && res.actionStatus!) {
        RatingsRepo().insertData(res.ratings!);
      }
    } catch (_) {}
    return res;
  }
}
