import 'package:cookee_common/Services/convert_service.dart';
import 'package:signup/app/models/models/questionneire_row_model.dart';
import 'package:signup/app/models/models/questions_model.dart';

class ApiGetQuestionniereModel {
  bool? status;
  bool? actionStatus;
  String? message;
  QuestionneireRowModel? questionneireRow;
  List<QuestionsModel>? questions;

  ApiGetQuestionniereModel({
    this.status,
    this.actionStatus,
    this.message,
    this.questionneireRow,
    this.questions,
  });

  factory ApiGetQuestionniereModel.fromJson(Map<String, dynamic> json) =>
      ApiGetQuestionniereModel(
        status: ConvertService.convertBool(json["status"]),
        actionStatus: ConvertService.convertBool(json["action_status"]),
        message: ConvertService.convertString(json["message"]),
        questionneireRow:
            QuestionneireRowModel.parseItem(json['questionneire_row']),
        questions: QuestionsModel.parseItems(json['questions']),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "action_status": actionStatus,
        "message": message,
        "questionneire_row": questionneireRow,
        "questions": questions,
      };

  static List<ApiGetQuestionniereModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<ApiGetQuestionniereModel> pros = list
            .map((data) => ApiGetQuestionniereModel.fromJson(data))
            .toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static ApiGetQuestionniereModel? parseItem(Map<String, dynamic> json) {
    if (json != null) {
      return ApiGetQuestionniereModel.fromJson(json);
    }
    return null;
  }

  ApiGetQuestionniereModel copyItem() => ApiGetQuestionniereModel(
        status: status,
        actionStatus: actionStatus,
        message: message,
        questionneireRow: questionneireRow,
        questions: questions,
      );

  List<ApiGetQuestionniereModel> copyItems(
      List<ApiGetQuestionniereModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static ApiGetQuestionniereModel initData() => ApiGetQuestionniereModel(
        status: false,
        actionStatus: false,
        message: "",
        questions: [],
      );
}
