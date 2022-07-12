import 'package:cookee_common/Services/convert_service.dart';

class PmChangeBatchModel {
  int? customerPackageId;
  int? batch;

  PmChangeBatchModel({
    this.customerPackageId,
    this.batch,
  });

  factory PmChangeBatchModel.fromJson(Map<String, dynamic> json) =>
      PmChangeBatchModel(
        customerPackageId:
            ConvertService.convertInt(json["customer_package_id"]),
        batch: ConvertService.convertInt(json["batch"]),
      );

  Map<String, dynamic> toJson() => {
        "customer_package_id": customerPackageId,
        "batch": batch,
      };

  static List<PmChangeBatchModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmChangeBatchModel> pros =
            list.map((data) => PmChangeBatchModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmChangeBatchModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmChangeBatchModel.fromJson(json);
    }
    return null;
  }

  PmChangeBatchModel copyItem() => PmChangeBatchModel(
        customerPackageId: customerPackageId,
        batch: batch,
      );

  List<PmChangeBatchModel> copyItems(List<PmChangeBatchModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmChangeBatchModel initData() => PmChangeBatchModel(
        customerPackageId: 0,
        batch: 0,
      );
}
