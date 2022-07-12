import 'package:cookee_common/Services/convert_service.dart';

class ApiCheckMeasurementData{

       bool? status;
       bool? actionStatus;
       String? message;
       bool? membershipActiveStatus;
       bool? benchMarkStatus;
       bool? benchMarkShowStatus;

      ApiCheckMeasurementData({
          this.status,
          this.actionStatus,
          this.message,
          this.membershipActiveStatus,
          this.benchMarkStatus,
          this.benchMarkShowStatus,
      });


      factory ApiCheckMeasurementData.fromJson(Map<String, dynamic> json) => ApiCheckMeasurementData(
          status: ConvertService.convertBool(json["status"]),
          actionStatus: ConvertService.convertBool(json["action_status"]),
          message: ConvertService.convertString(json["message"]),
          membershipActiveStatus: ConvertService.convertBool(json["membership_active_status"]),
          benchMarkStatus: ConvertService.convertBool(json["bench_mark_status"]),
          benchMarkShowStatus: ConvertService.convertBool(json["bench_mark_show_status"]),
      );

      Map<String, dynamic> toJson() => {
         "status": status,
         "action_status": actionStatus,
         "message": message,
         "membership_active_status": membershipActiveStatus,
         "bench_mark_status": benchMarkStatus,
         "bench_mark_show_status": benchMarkShowStatus,
      };

      static List<ApiCheckMeasurementData> parseItems(productJson){
      try{
             var list = productJson as List;
             if(list!=null){
                  List<ApiCheckMeasurementData> pros = list.map((data)=>ApiCheckMeasurementData.fromJson(data)).toList();
                  return pros;
              }
      }
      catch(_){}
         return [];
      }


      static ApiCheckMeasurementData? parseItem(Map<String, dynamic> json){
         if(json!=null){
               return ApiCheckMeasurementData.fromJson(json);
         }
         return null;
      }


      ApiCheckMeasurementData copyItem() => ApiCheckMeasurementData(
         status: status,
         actionStatus: actionStatus,
         message: message,
         membershipActiveStatus: membershipActiveStatus,
         benchMarkStatus: benchMarkStatus,
         benchMarkShowStatus: benchMarkShowStatus,
      );

      List<ApiCheckMeasurementData> copyItems(List<ApiCheckMeasurementData> items){
         return items.map((e) => e.copyItem()).toList();
       }

      static ApiCheckMeasurementData initData() => ApiCheckMeasurementData(
         status: false,
         actionStatus: false,
         message: "",
         membershipActiveStatus: false,
         benchMarkStatus: false,
         benchMarkShowStatus: false,
      );
}