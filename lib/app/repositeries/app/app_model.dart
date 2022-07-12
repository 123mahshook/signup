import 'package:signup/app/models/models/assistant_model.dart';
import 'package:signup/app/models/models/batches_model.dart';
import 'package:signup/app/models/models/customer_model.dart';
import 'package:signup/app/models/models/membership_model.dart';
import 'package:signup/app/models/models/package_model.dart';
import 'package:signup/app/models/models/rating_model.dart';

class AppModel {
  ///Singleton Settings
  static final AppModel _singleton = AppModel._internal();
  factory AppModel() {
    return _singleton;
  }
  AppModel._internal();
  int newMembershipCount = 0;
  int membershipCount = 0;
  int enquiryProgressPercentage = 0;
  int membershipProgressPercentage = 0;
  List<MembershipModel> membership = <MembershipModel>[];
  List<RatingModel> ratings = <RatingModel>[];
  CustomerModel? customer;
  String imageBaseUrl = "";
  int incentiveCurMonth = 0;
  int incentiveLastMonth = 0;
  double? ratingAverage = 0;
  List<AssistantModel> assistant = <AssistantModel>[];
  List<BatchesModel> batches = <BatchesModel>[];
  List<PackageModel> package = <PackageModel>[];
}
