import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/models/models/measurement_model.dart';
import 'package:signup/app/models/models/member_measurement_model.dart';

class ApiGetMemberMeasurementModel {
  bool? status;
  bool? actionStatus;
  String? message;
  List<MeasurementModel>? measurement;
  String? description;

  ApiGetMemberMeasurementModel(
      {this.status,
      this.actionStatus,
      this.message,
      this.measurement,
      this.description});

  factory ApiGetMemberMeasurementModel.fromJson(Map<String, dynamic> json) =>
      ApiGetMemberMeasurementModel(
          status: ConvertService.convertBool(json["status"]),
          actionStatus: ConvertService.convertBool(json["action_status"]),
          message: ConvertService.convertString(json["message"]),
          measurement: MeasurementModel.parseItems(json["mesasurements"]),
          description: "");

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "measurement": measurement,
        "dexcription": description
      };

  static List<ApiGetMemberMeasurementModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiGetMemberMeasurementModel> pros = list
            .map((data) => ApiGetMemberMeasurementModel.fromJson(data))
            .toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiGetMemberMeasurementModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiGetMemberMeasurementModel.fromJson(json);
    }
    return null;
  }

  ApiGetMemberMeasurementModel copyItem() => ApiGetMemberMeasurementModel(
      status: status,
      actionStatus: actionStatus,
      message: message,
      measurement: measurement,
      description: description);

  List<ApiGetMemberMeasurementModel> copyItems(
      List<ApiGetMemberMeasurementModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiGetMemberMeasurementModel initData() =>
      ApiGetMemberMeasurementModel(
          status: false,
          actionStatus: false,
          message: "",
          measurement: [],
          description: "");
}
