import 'package:cookee_common/Services/convert_service.dart';

class NutritionistModel {
  int? id;
  String? name;

  NutritionistModel({
    this.id,
    this.name,
  });

  factory NutritionistModel.fromJson(Map<String, dynamic> json) =>
      NutritionistModel(
        id: ConvertService.convertInt(json["id"]),
        name: ConvertService.convertString(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  static List<NutritionistModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<NutritionistModel> pros =
            list.map((data) => NutritionistModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static NutritionistModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return NutritionistModel.fromJson(json);
    }
    return null;
  }

  NutritionistModel copyItem() => NutritionistModel(
        id: id,
        name: name,
      );

  List<NutritionistModel> copyItems(List<NutritionistModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static NutritionistModel initData() => NutritionistModel(
        id: 0,
        name: "",
      );
}
