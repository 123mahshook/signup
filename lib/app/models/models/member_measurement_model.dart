import 'package:cookee_common/Services/convert_service.dart';

class MemberMeasurementModel {
  double? height;
  double? weight;
  double? thighs;
  double? hip;
  double? arm;
  double? waist;
  int? adminId;
  int? nutritionistId;
  String? measurementDate;
  int? benchmark;
  double? heightPercent;
  double? weightPercent;
  double? thighsPercent;
  double? hipPercent;
  double? armPercent;
  double? waistPercent;
  double? heightRef;
  double? weightRef;
  double? thighsRef;
  double? hipRef;
  double? armRef;
  double? waistRef;
  String? description;

  MemberMeasurementModel(
      {this.height,
      this.weight,
      this.thighs,
      this.hip,
      this.arm,
      this.waist,
      this.adminId,
      this.nutritionistId,
      this.measurementDate,
      this.benchmark,
      this.heightPercent,
      this.weightPercent,
      this.thighsPercent,
      this.hipPercent,
      this.armPercent,
      this.waistPercent,
      this.heightRef,
      this.weightRef,
      this.thighsRef,
      this.armRef,
      this.hipRef,
      this.waistRef,
      this.description});

  factory MemberMeasurementModel.fromJson(Map<String, dynamic> json) =>
      MemberMeasurementModel(
          height: ConvertService.convertDouble(json["height"]),
          weight: ConvertService.convertDouble(json["weight"]),
          thighs: ConvertService.convertDouble(json["thighs"]),
          hip: ConvertService.convertDouble(json["hip"]),
          arm: ConvertService.convertDouble(json["arm"]),
          waist: ConvertService.convertDouble(json["waist"]),
          adminId: ConvertService.convertInt(json["admin_id"]),
          nutritionistId: ConvertService.convertInt(json["nutritionist_id"]),
          measurementDate:
              ConvertService.convertString(json["measurement_date"]),
          benchmark: ConvertService.convertInt(json["benchmark"]),
          heightPercent: 0,
          weightPercent: 0,
          thighsPercent: 0,
          hipPercent: 0,
          armPercent: 0,
          waistPercent: 0,
          heightRef: 0,
          weightRef: 0,
          thighsRef: 0,
          hipRef: 0,
          armRef: 0,
          waistRef: 0,
          description: "");

  Map<String, dynamic> toJson() => {
        "height": height,
        "weight": weight,
        "thighs": thighs,
        "hip": hip,
        "arm": arm,
        "waist": waist,
        "admin_id": adminId,
        "nutritionist_id": nutritionistId,
        "measurement_date": measurementDate,
        "benchmark": benchmark
      };

  Map<String, dynamic> toJsonInsert() => {
        "height": height.toString(),
        "weight": weight.toString(),
        "thighs": thighs.toString(),
        "hip": hip.toString(),
        "arm": arm.toString(),
        "waist": waist.toString(),
        "admin_id": adminId.toString(),
        "nutritionist_id": nutritionistId.toString(),
        "measurement_date": measurementDate,
        "benchmark": benchmark.toString()
      };

  static List<MemberMeasurementModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<MemberMeasurementModel> pros =
            list.map((data) => MemberMeasurementModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static MemberMeasurementModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return MemberMeasurementModel.fromJson(json);
    }
    return null;
  }

  MemberMeasurementModel copyItem() => MemberMeasurementModel(
        height: height,
        weight: weight,
        thighs: thighs,
        hip: hip,
        arm: arm,
        waist: waist,
        adminId: adminId,
        nutritionistId: nutritionistId,
        measurementDate: measurementDate,
        benchmark: benchmark,
        heightPercent: heightPercent,
        weightPercent: weightPercent,
        thighsPercent: thighsPercent,
        hipPercent: hipPercent,
        armPercent: armPercent,
        waistPercent: waistPercent,
        description: description,
        heightRef: heightRef,
        weightRef: weightRef,
        thighsRef: thighsRef,
        hipRef: hipRef,
        armRef: armRef,
        waistRef: waistRef,
      );

  List<MemberMeasurementModel> copyItems(List<MemberMeasurementModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static MemberMeasurementModel initData() => MemberMeasurementModel(
      height: 0,
      weight: 0,
      thighs: 0,
      hip: 0,
      arm: 0,
      waist: 0,
      adminId: 0,
      nutritionistId: 0,
      measurementDate: "",
      benchmark: 0,
      heightPercent: 0,
      weightPercent: 0,
      thighsPercent: 0,
      hipPercent: 0,
      armPercent: 0,
      waistPercent: 0,
      description: "",
      heightRef: 0,
      weightRef: 0,
      thighsRef: 0,
      hipRef: 0,
      armRef: 0,
      waistRef: 0);
}
