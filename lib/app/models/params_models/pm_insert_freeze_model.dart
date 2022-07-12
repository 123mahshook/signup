import 'package:cookee_common/Services/convert_service.dart';

class PmInsertFreezeModel {
  String? customer;
  String? customerPackage;
  String? fromDate;
  String? toDate;
  String? freezeAmount;
  String? remarks;
  String? days;
  String? freezeId;

  PmInsertFreezeModel(
      {this.customer,
      this.customerPackage,
      this.fromDate,
      this.toDate,
      this.freezeAmount,
      this.remarks,
      this.days,
      this.freezeId});

  factory PmInsertFreezeModel.fromJson(Map<String, dynamic> json) =>
      PmInsertFreezeModel(
        customer: ConvertService.convertString(json["customer"]),
        customerPackage: ConvertService.convertString(json["customer_package"]),
        fromDate: ConvertService.convertString(json["from_date"]),
        toDate: ConvertService.convertString(json["to_date"]),
        freezeAmount: ConvertService.convertString(json["freeze_amount"]),
        remarks: ConvertService.convertString(json["remarks"]),
        freezeId: ConvertService.convertString(json["freeze_id"]),
      );

  Map<String, dynamic> toJson() => {
        "customer": customer,
        "customer_package": customerPackage,
        "from_date": fromDate,
        "to_date": toDate,
        "freeze_amount": freezeAmount,
        "remarks": remarks,
        "days": days,
        "freeze_id": freezeId
      };

  Map<String, dynamic> toJsonUnFreeze() => {
        "customer": customer,
        "customer_package": customerPackage,
        "from_date": fromDate,
        "to_date": toDate,
        "freeze_amount": freezeAmount,
        "remarks": remarks,
        "days": days,
        "freeze_id": freezeId
      };

  static List<PmInsertFreezeModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmInsertFreezeModel> pros =
            list.map((data) => PmInsertFreezeModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmInsertFreezeModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmInsertFreezeModel.fromJson(json);
    }
    return null;
  }

  PmInsertFreezeModel copyItem() => PmInsertFreezeModel(
      customer: customer,
      customerPackage: customerPackage,
      fromDate: fromDate,
      toDate: toDate,
      freezeAmount: freezeAmount,
      remarks: remarks,
      days: days,
      freezeId: freezeId);

  List<PmInsertFreezeModel> copyItems(List<PmInsertFreezeModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmInsertFreezeModel initData() => PmInsertFreezeModel(
      customer: "",
      customerPackage: "",
      fromDate: "",
      toDate: "",
      freezeAmount: "",
      remarks: "",
      days: "",
      freezeId: "");
}
