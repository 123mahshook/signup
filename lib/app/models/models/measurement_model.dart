import 'package:cookee_common/Services/convert_service.dart';

class MeasurementModel {
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
  double? bmHeightPercent;
  double? bmWeightPercent;
  double? bmThighsPercent;
  double? bmHipPercent;
  double? bmArmPercent;
  double? bmWaistPercent;
  double? prevHeightPercent;
  double? prevWeightPercent;
  double? prevThighsPercent;
  double? prevHipPercent;
  double? prevArmPercent;
  double? prevWaistPercent;
  double? bmHeightRef;
  double? bmWeightRef;
  double? bmThighsRef;
  double? bmHipRef;
  double? bmArmRef;
  double? bmWaistRef;
  double? prevHeightRef;
  double? prevWeightRef;
  double? prevThighsRef;
  double? prevHipRef;
  double? prevArmRef;
  double? prevWaistRef;

  MeasurementModel({
    this.height,
    this.weight,
    this.thighs,
    this.hip,
    this.arm,
    this.waist,
    this.adminId,
    this.nutritionistId,
    this.measurementDate,
    this.benchmark,
    this.bmHeightPercent,
    this.bmWeightPercent,
    this.bmThighsPercent,
    this.bmHipPercent,
    this.bmArmPercent,
    this.bmWaistPercent,
    this.prevHeightPercent,
    this.prevWeightPercent,
    this.prevThighsPercent,
    this.prevHipPercent,
    this.prevArmPercent,
    this.prevWaistPercent,
    this.bmHeightRef,
    this.bmWeightRef,
    this.bmThighsRef,
    this.bmHipRef,
    this.bmArmRef,
    this.bmWaistRef,
    this.prevHeightRef,
    this.prevWeightRef,
    this.prevThighsRef,
    this.prevHipRef,
    this.prevArmRef,
    this.prevWaistRef,
  });

  factory MeasurementModel.fromJson(Map<String, dynamic> json) =>
      MeasurementModel(
        height: ConvertService.convertDouble(json["height"]),
        weight: ConvertService.convertDouble(json["weight"]),
        thighs: ConvertService.convertDouble(json["thighs"]),
        hip: ConvertService.convertDouble(json["hip"]),
        arm: ConvertService.convertDouble(json["arm"]),
        waist: ConvertService.convertDouble(json["waist"]),
        adminId: ConvertService.convertInt(json["admin_id"]),
        nutritionistId: ConvertService.convertInt(json["nutritionist_id"]),
        measurementDate: ConvertService.convertString(json["measurement_date"]),
        benchmark: ConvertService.convertInt(json["benchmark"]),
        bmHeightPercent:
            ConvertService.convertDouble(json["bm_height_percent"]),
        bmWeightPercent:
            ConvertService.convertDouble(json["bm_weight_percent"]),
        bmThighsPercent:
            ConvertService.convertDouble(json["bm_thighs_percent"]),
        bmHipPercent: ConvertService.convertDouble(json["bm_hip_percent"]),
        bmArmPercent: ConvertService.convertDouble(json["bm_arm_percent"]),
        bmWaistPercent: ConvertService.convertDouble(json["bm_waist_percent"]),
        prevHeightPercent:
            ConvertService.convertDouble(json["prev_height_percent"]),
        prevWeightPercent:
            ConvertService.convertDouble(json["prev_weight_percent"]),
        prevThighsPercent:
            ConvertService.convertDouble(json["prev_thighs_percent"]),
        prevHipPercent: ConvertService.convertDouble(json["prev_hip_percent"]),
        prevArmPercent: ConvertService.convertDouble(json["prev_arm_percent"]),
        prevWaistPercent:
            ConvertService.convertDouble(json["prev_waist_percent"]),
        bmHeightRef: ConvertService.convertDouble(json["bm_height_ref"]),
        bmWeightRef: ConvertService.convertDouble(json["bm_weight_ref"]),
        bmThighsRef: ConvertService.convertDouble(json["bm_thighs_ref"]),
        bmHipRef: ConvertService.convertDouble(json["bm_hip_ref"]),
        bmArmRef: ConvertService.convertDouble(json["bm_arm_ref"]),
        bmWaistRef: ConvertService.convertDouble(json["bm_waist_ref"]),
        prevHeightRef: ConvertService.convertDouble(json["prev_height_ref"]),
        prevWeightRef: ConvertService.convertDouble(json["prev_weight_ref"]),
        prevThighsRef: ConvertService.convertDouble(json["prev_thighs_ref"]),
        prevHipRef: ConvertService.convertDouble(json["prev_hip_ref"]),
        prevArmRef: ConvertService.convertDouble(json["prev_arm_ref"]),
        prevWaistRef: ConvertService.convertDouble(json["prev_waist_ref"]),
      );

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
        "benchmark": benchmark,
        "bm_height_percent": bmHeightPercent,
        "bm_weight_percent": bmWeightPercent,
        "bm_thighs_percent": bmThighsPercent,
        "bm_hip_percent": bmHipPercent,
        "bm_arm_percent": bmArmPercent,
        "bm_waist_percent": bmWaistPercent,
        "prev_height_percent": prevHeightPercent,
        "prev_weight_percent": prevWeightPercent,
        "prev_thighs_percent": prevThighsPercent,
        "prev_hip_percent": prevHipPercent,
        "prev_arm_percent": prevArmPercent,
        "prev_waist_percent": prevWaistPercent,
        "bm_height_ref": bmHeightRef,
        "bm_weight_ref": bmWeightRef,
        "bm_thighs_ref": bmThighsRef,
        "bm_hip_ref": bmHipRef,
        "bm_arm_ref": bmArmRef,
        "bm_waist_ref": bmWaistRef,
        "prev_height_ref": prevHeightRef,
        "prev_weight_ref": prevWeightRef,
        "prev_thighs_ref": prevThighsRef,
        "prev_hip_ref": prevHipRef,
        "prev_arm_ref": prevArmRef,
        "prev_waist_ref": prevWaistRef,
      };

  static List<MeasurementModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<MeasurementModel> pros =
            list.map((data) => MeasurementModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static MeasurementModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return MeasurementModel.fromJson(json);
    }
    return null;
  }

  MeasurementModel copyItem() => MeasurementModel(
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
        bmHeightPercent: bmHeightPercent,
        bmWeightPercent: bmWeightPercent,
        bmThighsPercent: bmThighsPercent,
        bmHipPercent: bmHipPercent,
        bmArmPercent: bmArmPercent,
        bmWaistPercent: bmWaistPercent,
        prevHeightPercent: prevHeightPercent,
        prevWeightPercent: prevWeightPercent,
        prevThighsPercent: prevThighsPercent,
        prevHipPercent: prevHipPercent,
        prevArmPercent: prevArmPercent,
        prevWaistPercent: prevWaistPercent,
        bmHeightRef: bmHeightRef,
        bmWeightRef: bmWeightRef,
        bmThighsRef: bmThighsRef,
        bmHipRef: bmHipRef,
        bmArmRef: bmArmRef,
        bmWaistRef: bmWaistRef,
        prevHeightRef: prevHeightRef,
        prevWeightRef: prevWeightRef,
        prevThighsRef: prevThighsRef,
        prevHipRef: prevHipRef,
        prevArmRef: prevArmRef,
        prevWaistRef: prevWaistRef,
      );

  List<MeasurementModel> copyItems(List<MeasurementModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static MeasurementModel initData() => MeasurementModel(
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
        bmHeightPercent: 0,
        bmWeightPercent: 0,
        bmThighsPercent: 0,
        bmHipPercent: 0,
        bmArmPercent: 0,
        bmWaistPercent: 0,
        prevHeightPercent: 0,
        prevWeightPercent: 0,
        prevThighsPercent: 0,
        prevHipPercent: 0,
        prevArmPercent: 0,
        prevWaistPercent: 0,
        bmHeightRef: 0,
        bmWeightRef: 0,
        bmThighsRef: 0,
        bmHipRef: 0,
        bmArmRef: 0,
        bmWaistRef: 0,
        prevHeightRef: 0,
        prevWeightRef: 0,
        prevThighsRef: 0,
        prevHipRef: 0,
        prevArmRef: 0,
        prevWaistRef: 0,
      );
}
