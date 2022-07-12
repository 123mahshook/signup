import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/models/models/membership_model.dart';

class ApiChangeBatchModel {
  bool? status;
  bool? actionStatus;
  String? message;
  MembershipModel? membership;

  ApiChangeBatchModel({
    this.status,
    this.actionStatus,
    this.message,
    this.membership,
  });

  factory ApiChangeBatchModel.fromJson(Map<String, dynamic> json) =>
      ApiChangeBatchModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        membership: MembershipModel.parseItem(json["membership"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "membership": membership,
      };

  static List<ApiChangeBatchModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiChangeBatchModel> pros =
            list.map((data) => ApiChangeBatchModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiChangeBatchModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiChangeBatchModel.fromJson(json);
    }
    return null;
  }

  ApiChangeBatchModel copyItem() => ApiChangeBatchModel(
        status: status,
        actionStatus: actionStatus,
        message: message,
        membership: membership,
      );

  List<ApiChangeBatchModel> copyItems(List<ApiChangeBatchModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiChangeBatchModel initData() => ApiChangeBatchModel(
        status: false,
        actionStatus: false,
        message: "",
      );
}
