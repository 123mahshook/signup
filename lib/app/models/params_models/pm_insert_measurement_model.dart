import 'package:cookee_common/Services/convert_service.dart';

class PmInsertMeasurementModel {
  int? customer;
  double? height;
  double? weight;
  double? thighs;
  double? hip;
  double? arm;
  double? waist;
  String? measurementDate;
  int? benchmark;

  PmInsertMeasurementModel({
    this.customer,
    this.height,
    this.weight,
    this.thighs,
    this.hip,
    this.arm,
    this.waist,
    this.measurementDate,
    this.benchmark,
  });

  factory PmInsertMeasurementModel.fromJson(Map<String, dynamic> json) =>
      PmInsertMeasurementModel(
        customer: ConvertService.convertInt(json["customer"]),
        height: ConvertService.convertDouble(json["height"]),
        weight: ConvertService.convertDouble(json["weight"]),
        thighs: ConvertService.convertDouble(json["thighs"]),
        hip: ConvertService.convertDouble(json["hip"]),
        arm: ConvertService.convertDouble(json["arm"]),
        waist: ConvertService.convertDouble(json["waist"]),
        measurementDate: ConvertService.convertString(json["measurement_date"]),
        benchmark: ConvertService.convertInt(json["benchmark"]),
      );

  Map<String, dynamic> toJson() => {
        "customer": ConvertService.convertString(customer),
        "height": ConvertService.convertString(height),
        "weight": ConvertService.convertString(weight),
        "thighs": ConvertService.convertString(thighs),
        "hip": ConvertService.convertString(hip),
        "arm": ConvertService.convertString(arm),
        "waist": ConvertService.convertString(waist),
        "measurement_date": ConvertService.convertString(measurementDate),
        "benchmark": ConvertService.convertString(benchmark),
      };

  static List<PmInsertMeasurementModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<PmInsertMeasurementModel> pros = list
            .map((data) => PmInsertMeasurementModel.fromJson(data))
            .toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static PmInsertMeasurementModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return PmInsertMeasurementModel.fromJson(json);
    }
    return null;
  }

  PmInsertMeasurementModel copyItem() => PmInsertMeasurementModel(
        customer: customer,
        height: height,
        weight: weight,
        thighs: thighs,
        hip: hip,
        arm: arm,
        waist: waist,
        measurementDate: measurementDate,
        benchmark: benchmark,
      );

  List<PmInsertMeasurementModel> copyItems(
      List<PmInsertMeasurementModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static PmInsertMeasurementModel initData() => PmInsertMeasurementModel(
        customer: 0,
        height: 0,
        weight: 0,
        thighs: 0,
        hip: 0,
        arm: 0,
        waist: 0,
        measurementDate: "",
        benchmark: 0,
      );
}
