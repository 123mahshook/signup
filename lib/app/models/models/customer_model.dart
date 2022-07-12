import 'package:cookee_common/Services/convert_service.dart';

class CustomerModel {
  int? id;
  String? name;
  String? phone;
  int? salary;
  int? incentive;
  String? incentiveType;
  String? image;
  String? category;
  int? consultant;

  CustomerModel({
    this.id,
    this.name,
    this.phone,
    this.salary,
    this.incentive,
    this.incentiveType,
    this.image,
    this.category,
    this.consultant,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: ConvertService.convertInt(json["id"]),
        name: ConvertService.convertString(json["name"]),
        phone: ConvertService.convertString(json["phone"]),
        salary: ConvertService.convertInt(json["salary"]),
        incentive: ConvertService.convertInt(json["incentive"]),
        incentiveType: ConvertService.convertString(json["incentive_type"]),
        image: ConvertService.convertString(json["image"]),
        category: ConvertService.convertString(json["category"]),
        consultant: ConvertService.convertInt(json["consultant"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "salary": salary,
        "incentive": incentive,
        "incentive_type": incentiveType,
        "image": image,
        "category": category,
        "consultant": consultant,
      };

  static List<CustomerModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<CustomerModel> pros =
            list.map((data) => CustomerModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static CustomerModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return CustomerModel.fromJson(json);
    }
    return null;
  }

  CustomerModel copyItem() => CustomerModel(
        id: id,
        name: name,
        phone: phone,
        salary: salary,
        incentive: incentive,
        incentiveType: incentiveType,
        image: image,
        category: category,
        consultant: consultant,
      );

  List<CustomerModel> copyItems(List<CustomerModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static CustomerModel initData() => CustomerModel(
        id: 0,
        name: "",
        phone: "",
        salary: 0,
        incentive: 0,
        incentiveType: "",
        image: "",
        category: "",
        consultant: 0,
      );
}
