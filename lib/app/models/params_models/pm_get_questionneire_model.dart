import 'package:cookee_common/Services/convert_service.dart';

class PmGetQuestionneireUrlModel {
  String? customerId;

  PmGetQuestionneireUrlModel({this.customerId});

  factory PmGetQuestionneireUrlModel.fromJson(Map<String, dynamic> json) =>
      PmGetQuestionneireUrlModel(
        customerId: ConvertService.convertString(json["customer_id"]),
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
      };

  

  static PmGetQuestionneireUrlModel initData() => PmGetQuestionneireUrlModel(
        customerId: "",
      );
}
