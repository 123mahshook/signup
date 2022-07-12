import 'package:cookee_common/Services/convert_service.dart';

class PmGetFeedbackUrlModel {
  int? customerPackage;

  PmGetFeedbackUrlModel({this.customerPackage});

  factory PmGetFeedbackUrlModel.fromJson(Map<String, dynamic> json) =>
      PmGetFeedbackUrlModel(
        customerPackage: ConvertService.convertInt(json["customer_package"]),
      );

  Map<String, dynamic> toJson() => {
        "customer_package": customerPackage,
      };

  static List<PmGetFeedbackUrlModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmGetFeedbackUrlModel> pros =
            list.map((data) => PmGetFeedbackUrlModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmGetFeedbackUrlModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmGetFeedbackUrlModel.fromJson(json);
    }
    return null;
  }

  PmGetFeedbackUrlModel copyItem() =>
      PmGetFeedbackUrlModel(customerPackage: customerPackage);

  List<PmGetFeedbackUrlModel> copyItems(List<PmGetFeedbackUrlModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmGetFeedbackUrlModel initData() => PmGetFeedbackUrlModel(
        customerPackage: 0,
      );
}
