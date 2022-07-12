import 'package:cookee_common/Services/convert_service.dart';

class AssistantModel {
  String? id;
  String? name;

  AssistantModel({
    this.id,
    this.name,
  });

  factory AssistantModel.fromJson(Map<String, dynamic> json) => AssistantModel(
        id: ConvertService.convertString(json["id"]),
        name: ConvertService.convertString(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  static List<AssistantModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<AssistantModel> pros =
            list.map((data) => AssistantModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static AssistantModel? parseItem(json) {
    if (json != null) {
      return AssistantModel.fromJson(json);
    }
    return null;
  }

  AssistantModel copyItem() => AssistantModel(
        id: id,
        name: name,
      );

  List<AssistantModel> copyItems(List<AssistantModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static AssistantModel initData() => AssistantModel(
        id: "",
        name: "",
      );
}
