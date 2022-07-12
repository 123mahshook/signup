import 'package:cookee_common/Services/convert_service.dart';

class BatchesModel {
  int? id;
  String? name;

  BatchesModel({
    this.id,
    this.name,
  });

  factory BatchesModel.fromJson(Map<String, dynamic> json) => BatchesModel(
        id: ConvertService.convertInt(json["id"]),
        name: ConvertService.convertString(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  static List<BatchesModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<BatchesModel> pros =
            list.map((data) => BatchesModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static BatchesModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return BatchesModel.fromJson(json);
    }
    return null;
  }

  BatchesModel copyItem() => BatchesModel(
        id: id,
        name: name,
      );

  List<BatchesModel> copyItems(List<BatchesModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static BatchesModel initData() => BatchesModel(
        id: 0,
        name: "",
      );
}
