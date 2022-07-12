class PmCheckMeasurementModel {
  String? memberId;

  PmCheckMeasurementModel({this.memberId});

  Map<String, dynamic> toJson() => {
        "member_id": memberId,
      };

  static PmCheckMeasurementModel initData() => PmCheckMeasurementModel(
        memberId: "",
      );
}
