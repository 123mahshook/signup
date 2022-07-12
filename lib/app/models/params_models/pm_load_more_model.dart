import 'package:cookee_common/Services/convert_service.dart';

class PmLoadMoreModel {
  int? limit;
  int? skip;

  PmLoadMoreModel({
    this.limit,
    this.skip,
  });

  factory PmLoadMoreModel.fromJson(Map<String, dynamic> json) =>
      PmLoadMoreModel(
        limit: ConvertService.convertInt(json["limit"]),
        skip: ConvertService.convertInt(json["skip"]),
      );

  Map<String, dynamic> toJson() => {
        "limit": limit.toString(),
        "skip": skip.toString(),
      };

  static List<PmLoadMoreModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmLoadMoreModel> pros =
            list.map((data) => PmLoadMoreModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmLoadMoreModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmLoadMoreModel.fromJson(json);
    }
    return null;
  }

  PmLoadMoreModel copyItem() => PmLoadMoreModel(
        limit: limit,
        skip: skip,
      );

  List<PmLoadMoreModel> copyItems(List<PmLoadMoreModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmLoadMoreModel initData() => PmLoadMoreModel(
        limit: 0,
        skip: 0,
      );
}
