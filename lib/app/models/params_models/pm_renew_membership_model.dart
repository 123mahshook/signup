import 'package:cookee_common/Services/convert_service.dart';

class PmRenewMembershipModel {
  int? id;
  int? batch;
  int? package;
  String? startDate;
  String? endDate;
  int? packageAmount;
  int? discount;
  String? remarks;

  PmRenewMembershipModel({
    this.id,
    this.batch,
    this.package,
    this.startDate,
    this.endDate,
    this.packageAmount,
    this.discount,
    this.remarks,
  });

  factory PmRenewMembershipModel.fromJson(Map<String, dynamic> json) =>
      PmRenewMembershipModel(
        id: ConvertService.convertInt(json["id"]),
        batch: ConvertService.convertInt(json["batch"]),
        package: ConvertService.convertInt(json["package"]),
        startDate: ConvertService.convertString(json["start_date"]),
        endDate: ConvertService.convertString(json["end_date"]),
        packageAmount: ConvertService.convertInt(json["package_amount"]),
        discount: ConvertService.convertInt(json["discount"]),
        remarks: ConvertService.convertString(json["remarks"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "batch": batch,
        "package": package,
        "start_date": startDate,
        "end_date": endDate,
        "package_amount": packageAmount,
        "discount": discount,
        "remarks": remarks,
      };

  static List<PmRenewMembershipModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmRenewMembershipModel> pros =
            list.map((data) => PmRenewMembershipModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmRenewMembershipModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmRenewMembershipModel.fromJson(json);
    }
    return null;
  }

  PmRenewMembershipModel copyItem() => PmRenewMembershipModel(
        id: id,
        batch: batch,
        package: package,
        startDate: startDate,
        endDate: endDate,
        packageAmount: packageAmount,
        discount: discount,
        remarks: remarks,
      );

  List<PmRenewMembershipModel> copyItems(List<PmRenewMembershipModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmRenewMembershipModel initData() => PmRenewMembershipModel(
        id: 0,
        batch: 0,
        package: 0,
        startDate: "",
        endDate: "",
        packageAmount: 0,
        discount: 0,
        remarks: "",
      );
}
