import 'package:signup/core/constants/messages.dart';

class ApiActionStatusMessageModel {
  bool? status;
  bool? actionStatus;
  String? message;
  ApiActionStatusMessageModel({this.status, this.actionStatus, this.message});
  factory ApiActionStatusMessageModel.fromJson(Map<String, dynamic> json) =>
      ApiActionStatusMessageModel(
        status: json["status"],
        actionStatus: json["action_status"],
        message: getString(json["message"]),
      );

  static String getString(data) {
    if (data != null) {
      return data.toString();
    } else {
      return "";
    }
  }

  factory ApiActionStatusMessageModel.loadInit() => ApiActionStatusMessageModel(
        status: true,
        actionStatus: false,
        message: "",
      );

  factory ApiActionStatusMessageModel.loadError() =>
      ApiActionStatusMessageModel(
        status: false,
        actionStatus: false,
        message: msSomethingWentWrong,
      );

  factory ApiActionStatusMessageModel.loadNoInternet() =>
      ApiActionStatusMessageModel(
        status: false,
        actionStatus: false,
        message: msNoInternetConnection,
      );
}
