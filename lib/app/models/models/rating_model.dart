
import 'package:cookee_common/Services/convert_service.dart';

class RatingModel{

       int? id;
       String? remarks;
       String? createdDate;
       double? rating;

      RatingModel({
          this.id,
          this.remarks,
          this.createdDate,
          this.rating,
      });


      factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
          id: ConvertService.convertInt(json["id"]),
          remarks: ConvertService.convertString(json["remarks"]),
          createdDate: ConvertService.convertString(json["created_date"]),
          rating: ConvertService.convertDouble(json["rating"]),
      );

      Map<String, dynamic> toJson() => {
         "id": id,
         "remarks": remarks,
         "created_date": createdDate,
         "rating": rating,
      };

      static List<RatingModel> parseItems(productJson){
      try{
             var list = productJson as List;
             if(list!=null){
                  List<RatingModel> pros = list.map((data)=>RatingModel.fromJson(data)).toList();
                  return pros;
              }
      }
      catch(_){}
         return [];
      }


      static RatingModel? parseItem(Map<String, dynamic> json){
         if(json!=null){
               return RatingModel.fromJson(json);
         }
         return null;
      }


      RatingModel copyItem() => RatingModel(
         id: id,
         remarks: remarks,
         createdDate: createdDate,
         rating: rating,
      );

      List<RatingModel> copyItems(List<RatingModel> items){
         return items.map((e) => e.copyItem()).toList();
       }

      static RatingModel initData() => RatingModel(
         id: 0,
         remarks: "",
         createdDate: "",
         rating: 0,
      );
}