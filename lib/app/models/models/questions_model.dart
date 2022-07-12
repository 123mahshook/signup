import 'package:cookee_common/Services/convert_service.dart';
                
                        class QuestionsModel{
                              String? question; 
                                              String? answer; 
                                        
                              QuestionsModel({ 
                               this.question,
                                                   this.answer,
                                                  });
                        
        
                                factory QuestionsModel.fromJson(Map<String, dynamic> json) => QuestionsModel(
                                
                                                question: ConvertService.convertString(json["question"]), 
                                
                                                answer: ConvertService.convertString(json["answer"]), 
                               );
                        
                            Map<String, dynamic> toJson() => {
                               "question": question,
                                                   "answer": answer,
                                                   };
                            
                                static List<QuestionsModel> parseItems(productJson){
                                    try{
                                            var list = productJson as List;
                                            if(list!=null){
                                                    List<QuestionsModel> pros = list.map((data)=>QuestionsModel.fromJson(data)).toList();
                                                    return pros;
                                                }
                                        }
                                    catch(_){}
                                    return [];
                                    }
                        
        
                            static QuestionsModel? parseItem(Map<String, dynamic> json){
                                    if(json!=null){ 
                                            return QuestionsModel.fromJson(json);
                                        }
                                    return null;
                                }
                        
        
                            QuestionsModel copyItem() => QuestionsModel(
                         question: question,
                                             answer: answer,
                                                 );
        
                        List<QuestionsModel> copyItems(List<QuestionsModel> items){
                                    return items.map((e) => e.copyItem()).toList();
                            }
        
                            static QuestionsModel initData() => QuestionsModel(
                             question: "",
                                                 answer: "",
                                                     );    
                        }
                        
                    