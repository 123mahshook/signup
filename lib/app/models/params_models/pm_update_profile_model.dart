import 'package:cookee_common/Services/convert_service.dart';

class PmUpdateProfileModel {
  String? name;
  String? password;
  String? image;

  PmUpdateProfileModel({this.name, this.password, this.image});

  factory PmUpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      PmUpdateProfileModel(
        name: ConvertService.convertString(json["name"]),
        password: ConvertService.convertString(json["password"]),
        image: ConvertService.convertString(json["image"]),
      );

  Map<String, dynamic> toJson() =>
      {"name": name, "password": password, "image": image};

  static List<PmUpdateProfileModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmUpdateProfileModel> pros =
            list.map((data) => PmUpdateProfileModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmUpdateProfileModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmUpdateProfileModel.fromJson(json);
    }
    return null;
  }

  PmUpdateProfileModel copyItem() => PmUpdateProfileModel(
        name: name,
        password: password,
        image: image,
      );

  List<PmUpdateProfileModel> copyItems(List<PmUpdateProfileModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmUpdateProfileModel initData() => PmUpdateProfileModel(
        name: "",
        password: "",
        image: "",
      );
}
