import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_get_home_data_model.dart';

class GetHomeDataService extends BaseService {
  Future<ApiGetHomeDataModel> get() async {
    ApiGetHomeDataModel res = ApiGetHomeDataModel.initData();
    try {
      res = await appApiRepo.getHomeData();
      _setData(res);
    } catch (_) {}
    return res;
  }

  _setData(ApiGetHomeDataModel res) {
    try {
      if (res.status! && res.actionStatus!) {
        appModel!.customer = res.customer;
        appModel!.imageBaseUrl = res.imageBaseUrl!;
        appModel!.incentiveCurMonth = res.incentiveCurMonth!;
        appModel!.incentiveLastMonth = res.incentiveLastMonth!;
        appModel!.membership = res.membership!;
        appModel!.membershipCount = res.membershipCount!;
        appModel!.membershipProgressPercentage =
            res.membershipProgressPercentage!;
        appModel!.newMembershipCount = res.newMembershipCount!;
        appModel!.ratings = res.ratings!;
        appModel!.ratingAverage = res.ratingAverage!;
        appModel!.assistant = res.assistant!;
        appModel!.batches = res.batches!;
        appModel!.package = res.package!;
      }
    } catch (_) {}
  }
}
