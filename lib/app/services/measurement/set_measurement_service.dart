/*import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/api_models/api_get_member_measurement_model.dart';
import 'package:signup/app/models/models/member_measurement_model.dart';

class SetMeasurementService extends BaseService {
  ApiGetMemberMeasurementModel set(ApiGetMemberMeasurementModel param) {
    try {
      param.measurement = _setData(param.measurement!);
      if (param.measurement!.isNotEmpty) {
        if (param.measurement![0].weightPercent! > 0) {
          param.description =
              param.measurement![0].weightPercent.toString() + "% Weight gain";
        } else if (param.measurement![0].weightPercent! < 0) {
          param.description =
              param.measurement![0].weightPercent!.abs().toString() +
                  "% Weight Loss";
        } else {
          param.description = "";
        }
      }
    } catch (_) {}
    return param;
  }

  List<MemberMeasurementModel> _setData(List<MemberMeasurementModel> data) {
    try {
      data = data.reversed.toList();
      int refHeight = 0;
      int refWeight = 0;
      int refThighs = 0;
      int refHip = 0;
      int refArm = 0;
      int refWaist = 0;
      bool refExist = false;
      int i = 0;
      for (var dt in data) {
        if (refExist) {
          data[i].heightPercent = _calculatePercent(dt.height!, refHeight);
          data[i].weightPercent = _calculatePercent(dt.weight!, refWeight);
          data[i].armPercent = _calculatePercent(dt.arm!, refArm);
          data[i].hipPercent = _calculatePercent(dt.hip!, refHip);
          data[i].thighsPercent =
              _calculatePercent(dt.thighsPercent!, refThighs);
          data[i].waistPercent = _calculatePercent(dt.waist!, refWaist);
        }
        data[i].heightRef = refHeight;
        data[i].weightRef = refWeight;
        data[i].armRef = refArm;
        data[i].hipRef = refHip;
        data[i].thighsRef = refThighs;
        data[i].waistRef = refWaist;
        if (dt.benchmark == 1) {
          refExist = true;
          refHeight = dt.height!;
          refWeight = dt.weight!;
          refThighs = dt.thighs!;
          refHip = dt.hip!;
          refArm = dt.arm!;
          refWaist = dt.waist!;
        }
        i++;
      }
      data = data.reversed.toList();
    } catch (_) {}
    return data;
  }

  int _calculatePercent(int newVal, int refVal) {
    try {
      if (newVal > 0 && refVal > 0) {
        return (((newVal - refVal) / newVal) * 100).floor();
      }
    } catch (_) {}
    return 0;
  }
}*/
