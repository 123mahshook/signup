import 'package:cookee_common/Services/convert_service.dart';

class PackageModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? tenure;
  String? packageType;

  PackageModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.tenure,
    this.packageType,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
        id: ConvertService.convertInt(json["id"]),
        name: ConvertService.convertString(json["name"]),
        description: ConvertService.convertString(json["description"]),
        price: ConvertService.convertInt(json["price"]),
        tenure: ConvertService.convertInt(json["tenure"]),
        packageType: ConvertService.convertString(json["package_type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "tenure": tenure,
        "package_type": packageType,
      };

  static List<PackageModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PackageModel> pros =
            list.map((data) => PackageModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PackageModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PackageModel.fromJson(json);
    }
    return null;
  }

  PackageModel copyItem() => PackageModel(
        id: id,
        name: name,
        description: description,
        price: price,
        tenure: tenure,
        packageType: packageType,
      );

  List<PackageModel> copyItems(List<PackageModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PackageModel initData() => PackageModel(
        id: 0,
        name: "",
        description: "",
        price: 0,
        tenure: 0,
        packageType: "",
      );
}
