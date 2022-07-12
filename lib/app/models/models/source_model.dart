import 'package:cookee_common/Services/convert_service.dart';

class SourceModel {
  int? id;
  String? name;

  SourceModel({
    this.id,
    this.name,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: ConvertService.convertInt(json["id"]),
        name: ConvertService.convertString(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  static List<SourceModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<SourceModel> pros =
            list.map((data) => SourceModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static SourceModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return SourceModel.fromJson(json);
    }
    return null;
  }

  SourceModel copyItem() => SourceModel(
        id: id,
        name: name,
      );

  List<SourceModel> copyItems(List<SourceModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static SourceModel initData() => SourceModel(
        id: 0,
        name: "",
      );
}
