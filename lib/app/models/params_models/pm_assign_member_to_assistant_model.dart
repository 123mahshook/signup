import 'package:cookee_common/Services/convert_service.dart';

class PmAssignMemberToAssistantModel {
  String? customerPackage;
  String? assistantId;

  PmAssignMemberToAssistantModel({
    this.customerPackage,
    this.assistantId,
  });

  factory PmAssignMemberToAssistantModel.fromJson(Map<String, dynamic> json) =>
      PmAssignMemberToAssistantModel(
        customerPackage: ConvertService.convertString(json["customer_package"]),
        assistantId: ConvertService.convertString(json["assistant_id"]),
      );

  Map<String, dynamic> toJson() => {
        "customer_package": customerPackage,
        "assistant_id": assistantId,
      };

  static List<PmAssignMemberToAssistantModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmAssignMemberToAssistantModel> pros = list
            .map((data) => PmAssignMemberToAssistantModel.fromJson(data))
            .toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmAssignMemberToAssistantModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmAssignMemberToAssistantModel.fromJson(json);
    }
    return null;
  }

  PmAssignMemberToAssistantModel copyItem() => PmAssignMemberToAssistantModel(
        customerPackage: customerPackage,
        assistantId: assistantId,
      );

  List<PmAssignMemberToAssistantModel> copyItems(
      List<PmAssignMemberToAssistantModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmAssignMemberToAssistantModel initData() =>
      PmAssignMemberToAssistantModel(
        customerPackage: "",
        assistantId: "",
      );
}
