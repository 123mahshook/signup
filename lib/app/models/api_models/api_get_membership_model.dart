import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/models/models/membership_model.dart';

class ApiGetMembershipModel {
  bool? status;
  bool? actionStatus;
  String? message;
  List<MembershipModel>? membership;

  ApiGetMembershipModel({
    this.status,
    this.actionStatus,
    this.message,
    this.membership,
  });

  factory ApiGetMembershipModel.fromJson(Map<String, dynamic> json) =>
      ApiGetMembershipModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        membership: MembershipModel.parseItems(json['membership']),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "membership": membership,
      };

  static List<ApiGetMembershipModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiGetMembershipModel> pros =
            list.map((data) => ApiGetMembershipModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiGetMembershipModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiGetMembershipModel.fromJson(json);
    }
    return null;
  }

  ApiGetMembershipModel copyItem() => ApiGetMembershipModel(
        status: status,
        actionStatus: actionStatus,
        message: message,
        membership: membership,
      );

  List<ApiGetMembershipModel> copyItems(List<ApiGetMembershipModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiGetMembershipModel initData() => ApiGetMembershipModel(
        status: false,
        actionStatus: false,
        message: "",
        membership: [],
      );
}
