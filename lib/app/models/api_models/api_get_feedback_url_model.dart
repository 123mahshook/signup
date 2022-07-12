import 'package:cookee_common/Services/convert_service.dart';

class ApiGetFeedbackModel {
  bool? status;
  bool? actionStatus;
  String? message;
  String? feedbackUrl;

  ApiGetFeedbackModel({
    this.status,
    this.actionStatus,
    this.message,
    this.feedbackUrl,
  });

  factory ApiGetFeedbackModel.fromJson(Map<String, dynamic> json) =>
      ApiGetFeedbackModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        feedbackUrl: ConvertService.convertString(json["feedback_url"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "feedback_url": feedbackUrl,
      };

  static List<ApiGetFeedbackModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiGetFeedbackModel> pros =
            list.map((data) => ApiGetFeedbackModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiGetFeedbackModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiGetFeedbackModel.fromJson(json);
    }
    return null;
  }

  ApiGetFeedbackModel copyItem() => ApiGetFeedbackModel(
        status: status,
        actionStatus: actionStatus,
        message: message,
        feedbackUrl: feedbackUrl,
      );

  List<ApiGetFeedbackModel> copyItems(List<ApiGetFeedbackModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiGetFeedbackModel initData() => ApiGetFeedbackModel(
        status: false,
        actionStatus: false,
        message: "",
        feedbackUrl: "",
      );
}
