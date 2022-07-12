import 'package:cookee_common/Services/convert_service.dart';

class PmUpdatePacerAppStatusModel {
  String? customer;
  int? status;

  PmUpdatePacerAppStatusModel({
    this.customer,
    this.status,
  });

  factory PmUpdatePacerAppStatusModel.fromJson(Map<String, dynamic> json) =>
      PmUpdatePacerAppStatusModel(
        customer: ConvertService.convertString(json["customer"]),
        status: ConvertService.convertInt(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer,
        "status": status,
      };

  static List<PmUpdatePacerAppStatusModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmUpdatePacerAppStatusModel> pros = list
            .map((data) => PmUpdatePacerAppStatusModel.fromJson(data))
            .toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmUpdatePacerAppStatusModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmUpdatePacerAppStatusModel.fromJson(json);
    }
    return null;
  }

  PmUpdatePacerAppStatusModel copyItem() => PmUpdatePacerAppStatusModel(
        customer: customer,
        status: status,
      );

  List<PmUpdatePacerAppStatusModel> copyItems(
      List<PmUpdatePacerAppStatusModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmUpdatePacerAppStatusModel initData() => PmUpdatePacerAppStatusModel(
        customer: "",
        status: 0,
      );
}
