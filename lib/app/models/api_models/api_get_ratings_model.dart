import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/models/models/membership_model.dart';
import 'package:signup/app/models/models/rating_model.dart';

class ApiGetRatingsModel {
  bool? status;
  bool? actionStatus;
  String? message;
  List<RatingModel>? ratings;

  ApiGetRatingsModel({
    this.status,
    this.actionStatus,
    this.message,
    this.ratings,
  });

  factory ApiGetRatingsModel.fromJson(Map<String, dynamic> json) =>
      ApiGetRatingsModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        ratings: RatingModel.parseItems(json["ratings"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "ratings": ratings,
      };

  static List<ApiGetRatingsModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiGetRatingsModel> pros =
            list.map((data) => ApiGetRatingsModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiGetRatingsModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiGetRatingsModel.fromJson(json);
    }
    return null;
  }

  ApiGetRatingsModel copyItem() => ApiGetRatingsModel(
      status: status,
      actionStatus: actionStatus,
      message: message,
      ratings: ratings);

  List<ApiGetRatingsModel> copyItems(List<ApiGetRatingsModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiGetRatingsModel initData() => ApiGetRatingsModel(
      status: false, actionStatus: false, message: "", ratings: []);
}
