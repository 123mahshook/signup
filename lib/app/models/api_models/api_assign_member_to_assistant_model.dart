import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/models/models/membership_model.dart';

class ApiAssignMembertoAssistantModel {
  bool? status;
  bool? actionStatus;
  String? message;
  MembershipModel? membership;

  ApiAssignMembertoAssistantModel({
    this.status,
    this.actionStatus,
    this.message,
    this.membership,
  });

  factory ApiAssignMembertoAssistantModel.fromJson(Map<String, dynamic> json) =>
      ApiAssignMembertoAssistantModel(
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

  static List<ApiAssignMembertoAssistantModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiAssignMembertoAssistantModel> pros = list
            .map((data) => ApiAssignMembertoAssistantModel.fromJson(data))
            .toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiAssignMembertoAssistantModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiAssignMembertoAssistantModel.fromJson(json);
    }
    return null;
  }

  ApiAssignMembertoAssistantModel copyItem() => ApiAssignMembertoAssistantModel(
        status: status,
        actionStatus: actionStatus,
        message: message,
        membership: membership,
      );

  List<ApiAssignMembertoAssistantModel> copyItems(
      List<ApiAssignMembertoAssistantModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiAssignMembertoAssistantModel initData() =>
      ApiAssignMembertoAssistantModel(
        status: false,
        actionStatus: false,
        message: "",
      );
}
