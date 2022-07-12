import 'package:cookee_common/Services/convert_service.dart';
                
                        class QuestionneireRowModel{
                              int? id; 
                                              int? customer; 
                                              String? name; 
                                              String? age; 
                                              String? gender; 
                                              String? createdDate; 
                                        
                              QuestionneireRowModel({ 
                               this.id,
                                                   this.customer,
                                                   this.name,
                                                   this.age,
                                                   this.gender,
                                                   this.createdDate,
                                                  });
                        
        
                                factory QuestionneireRowModel.fromJson(Map<String, dynamic> json) => QuestionneireRowModel(
                                
                                                id: ConvertService.convertInt(json["id"]), 
                                    
                                                customer: ConvertService.convertInt(json["customer"]), 
                                    
                                                name: ConvertService.convertString(json["name"]), 
                                
                                                age: ConvertService.convertString(json["age"]), 
                                
                                                gender: ConvertService.convertString(json["gender"]), 
                                
                                                createdDate: ConvertService.convertString(json["created_date"]), 
                               );
                        
                            Map<String, dynamic> toJson() => {
                               "id": id,
                                                   "customer": customer,
                                                   "name": name,
                                                   "age": age,
                                                   "gender": gender,
                                                   "created_date": createdDate,
                                                   };
                            
                                static List<QuestionneireRowModel> parseItems(productJson){
                                    try{
                                            var list = productJson as List;
                                            if(list!=null){
                                                    List<QuestionneireRowModel> pros = list.map((data)=>QuestionneireRowModel.fromJson(data)).toList();
                                                    return pros;
                                                }
                                        }
                                    catch(_){}
                                    return [];
                                    }
                        
        
                            static QuestionneireRowModel? parseItem(Map<String, dynamic> json){
                                    if(json!=null){ 
                                            return QuestionneireRowModel.fromJson(json);
                                        }
                                    return null;
                                }
                        
        
                            QuestionneireRowModel copyItem() => QuestionneireRowModel(
                         id: id,
                                             customer: customer,
                                             name: name,
                                             age: age,
                                             gender: gender,
                                             createdDate: createdDate,
                                                 );
        
                        List<QuestionneireRowModel> copyItems(List<QuestionneireRowModel> items){
                                    return items.map((e) => e.copyItem()).toList();
                            }
        
                            static QuestionneireRowModel initData() => QuestionneireRowModel(
                             id: 0,
                                                 customer: 0,
                                                 name: "",
                                                 age: "",
                                                 gender: "",
                                                 createdDate: "",
                                                     );    
                        }
                        
                    