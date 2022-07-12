import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/models/models/customer_model.dart';

class ApiMakeAuthModel {
  bool? status;
  bool? actionStatus;
  String? message;
  String? accessTokken;
  CustomerModel? user;

  ApiMakeAuthModel({
    this.status,
    this.actionStatus,
    this.message,
    this.accessTokken,
    this.user,
  });

  factory ApiMakeAuthModel.fromJson(Map<String, dynamic> json) =>
      ApiMakeAuthModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        accessTokken: ConvertService.convertString(json["access_tokken"]),
        user: CustomerModel.parseItem(json['user']),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "access_tokken": accessTokken,
        "user": user,
      };

  static List<ApiMakeAuthModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiMakeAuthModel> pros =
            list.map((data) => ApiMakeAuthModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiMakeAuthModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiMakeAuthModel.fromJson(json);
    }
    return null;
  }

  ApiMakeAuthModel copyItem() => ApiMakeAuthModel(
        status: status,
        actionStatus: actionStatus,
        message: message,
        accessTokken: accessTokken,
        user: user,
      );

  List<ApiMakeAuthModel> copyItems(List<ApiMakeAuthModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiMakeAuthModel initData() => ApiMakeAuthModel(
        status: false,
        actionStatus: false,
        message: "",
        accessTokken: "",
      );
}
