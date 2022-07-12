import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/models/models/customer_model.dart';

class ApiUpdateProfileModel {
  bool? status;
  bool? actionStatus;
  String? message;
  List<CustomerModel>? customer;

  ApiUpdateProfileModel({
    this.status,
    this.actionStatus,
    this.message,
    this.customer,
  });

  factory ApiUpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      ApiUpdateProfileModel(
          status: ConvertService.convertBool(json["status"]),
          actionStatus: ConvertService.convertBool(json["action_status"]),
          message: ConvertService.convertString(json["message"]),
          customer: CustomerModel.parseItems(json['customer']));

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "customer": customer
      };

  static List<ApiUpdateProfileModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiUpdateProfileModel> pros =
            list.map((data) => ApiUpdateProfileModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiUpdateProfileModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiUpdateProfileModel.fromJson(json);
    }
    return null;
  }

  ApiUpdateProfileModel copyItem() => ApiUpdateProfileModel(
        status: status,
        actionStatus: actionStatus,
        message: message,
        customer: customer,
      );

  List<ApiUpdateProfileModel> copyItems(List<ApiUpdateProfileModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiUpdateProfileModel initData() => ApiUpdateProfileModel(
        status: false,
        actionStatus: false,
        message: "",
        customer: [],
      );
}
