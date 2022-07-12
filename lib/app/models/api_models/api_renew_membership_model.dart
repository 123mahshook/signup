import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/models/models/membership_model.dart';

class ApiRenewMembershipModel {
  bool? status;
  bool? actionStatus;
  String? message;
  MembershipModel? membership;
  String? package;

  ApiRenewMembershipModel({
    this.status,
    this.actionStatus,
    this.message,
    this.membership,
    this.package,
  });

  factory ApiRenewMembershipModel.fromJson(Map<String, dynamic> json) =>
      ApiRenewMembershipModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        membership: MembershipModel.parseItem(json["membership"]),
        package: ConvertService.convertString(json["package"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "membership": membership,
        "package": package,
      };

  static List<ApiRenewMembershipModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiRenewMembershipModel> pros =
            list.map((data) => ApiRenewMembershipModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiRenewMembershipModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiRenewMembershipModel.fromJson(json);
    }
    return null;
  }

  ApiRenewMembershipModel copyItem() => ApiRenewMembershipModel(
        status: status,
        actionStatus: actionStatus,
        message: message,
        membership: membership,
        package: package,
      );

  List<ApiRenewMembershipModel> copyItems(List<ApiRenewMembershipModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiRenewMembershipModel initData() => ApiRenewMembershipModel(
        status: false,
        actionStatus: false,
        message: "",
        package: "",
      );
}
