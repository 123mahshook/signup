import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/models/models/assistant_model.dart';
import 'package:signup/app/models/models/batches_model.dart';
import 'package:signup/app/models/models/customer_model.dart';
import 'package:signup/app/models/models/membership_model.dart';
import 'package:signup/app/models/models/package_model.dart';
import 'package:signup/app/models/models/rating_model.dart';
import 'package:signup/core/models/api_models/api_action_status_message.dart';

class ApiGetHomeDataModel {
  bool? status;
  bool? actionStatus;
  String? message;
  int? newMembershipCount;
  int? membershipCount;
  int? enquiryProgressPercentage;
  int? membershipProgressPercentage;
  List<MembershipModel>? membership;
  List<RatingModel>? ratings;
  CustomerModel? customer;
  String? imageBaseUrl;
  int? incentiveCurMonth;
  int? incentiveLastMonth;
  double? ratingAverage;
  List<AssistantModel>? assistant;
  List<BatchesModel>? batches;
  List<PackageModel>? package;

  ApiGetHomeDataModel({
    this.status,
    this.actionStatus,
    this.message,
    this.newMembershipCount,
    this.membershipCount,
    this.enquiryProgressPercentage,
    this.membershipProgressPercentage,
    this.membership,
    this.ratings,
    this.customer,
    this.imageBaseUrl,
    this.incentiveCurMonth,
    this.incentiveLastMonth,
    this.ratingAverage,
    this.assistant,
    this.batches,
    this.package,
  });

  factory ApiGetHomeDataModel.fromJson(Map<String, dynamic> json) =>
      ApiGetHomeDataModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        newMembershipCount:
            ConvertService.convertInt(json["new_memberships_count"]),
        membershipCount: ConvertService.convertInt(json["memberships_count"]),
        enquiryProgressPercentage:
            ConvertService.convertInt(json["enquiry_progress_percentage"]),
        membershipProgressPercentage:
            ConvertService.convertInt(json["membership_progress_percentage"]),
        membership: MembershipModel.parseItems(json['membership']),
        ratings: RatingModel.parseItems(json["ratings"]),
        customer: CustomerModel.parseItem(json['customer']),
        imageBaseUrl: ConvertService.convertString(json["image_base_url"]),
        incentiveCurMonth:
            ConvertService.convertInt(json["incentive_cur_month"]),
        incentiveLastMonth:
            ConvertService.convertInt(json["incentive_last_month"]),
        ratingAverage: ConvertService.convertDouble(json["rating_average"]),
        assistant: AssistantModel.parseItems(json["assistant"]),
        batches: BatchesModel.parseItems(json["batches"]),
        package: PackageModel.parseItems(json['packages']),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "new_membership_count": newMembershipCount,
        "membership_count": membershipCount,
        "enquiry_progress_percentage": enquiryProgressPercentage,
        "membership_progress_percentage": membershipProgressPercentage,
        "membership": membership,
        "ratings": ratings,
        "customer": customer,
        "image_base_url": imageBaseUrl,
        "incentive_cur_month": incentiveCurMonth,
        "incentive_last_month": incentiveLastMonth,
        "rating_average": ratingAverage,
        "assistant": assistant,
        "batches": batches,
        "packages": package,
      };

  static List<ApiGetHomeDataModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiGetHomeDataModel> pros =
            list.map((data) => ApiGetHomeDataModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiGetHomeDataModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiGetHomeDataModel.fromJson(json);
    }
    return null;
  }

  ApiGetHomeDataModel copyItem() => ApiGetHomeDataModel(
        status: status,
        actionStatus: actionStatus,
        message: message,
        newMembershipCount: newMembershipCount,
        membershipCount: membershipCount,
        enquiryProgressPercentage: enquiryProgressPercentage,
        membershipProgressPercentage: membershipProgressPercentage,
        membership: membership,
        customer: customer,
        imageBaseUrl: imageBaseUrl,
        ratings: ratings,
        incentiveCurMonth: incentiveCurMonth,
        incentiveLastMonth: incentiveLastMonth,
        ratingAverage: ratingAverage,
        assistant: assistant,
        batches: batches,
        package: package,
      );

  List<ApiGetHomeDataModel> copyItems(List<ApiGetHomeDataModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiGetHomeDataModel initData() => ApiGetHomeDataModel(
        status: false,
        actionStatus: false,
        message: "",
        newMembershipCount: 0,
        membershipCount: 0,
        enquiryProgressPercentage: 0,
        membershipProgressPercentage: 0,
        membership: [],
        imageBaseUrl: "",
        ratings: [],
        incentiveCurMonth: 0,
        incentiveLastMonth: 0,
        ratingAverage: 0,
        assistant: [],
        batches: [],
        package: [],
      );

  ApiActionStatusMessageModel loadActionStatus() => ApiActionStatusMessageModel(
      status: status, actionStatus: actionStatus, message: message);
}
