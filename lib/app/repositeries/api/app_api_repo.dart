import 'package:cookee_api/constants/core_constants.dart';
import 'package:cookee_api/repo/api_app_general_repo.dart';
import 'package:cookee_api/repo/api_appprofile_repo.dart';
import 'package:signup/app/constants/web_config_contants.dart';
import 'package:signup/app/contracts/base_repo.dart';
import 'package:signup/app/models/api_models/api_assign_member_to_assistant_model.dart';
import 'package:signup/app/models/api_models/api_change_batch_model.dart';
import 'package:signup/app/models/api_models/api_check_measurement_model.dart';
import 'package:signup/app/models/api_models/api_get_feedback_url_model.dart';
import 'package:signup/app/models/api_models/api_get_home_data_model.dart';
import 'package:signup/app/models/api_models/api_get_member_measurement_model.dart';
import 'package:signup/app/models/api_models/api_get_membership_model.dart';
import 'package:signup/app/models/api_models/api_get_questionniere_model.dart';
import 'package:signup/app/models/api_models/api_get_ratings_model.dart';
import 'package:signup/app/models/api_models/api_make_auth_model.dart';
import 'package:signup/app/models/api_models/api_renew_membership_model.dart';
import 'package:signup/app/models/api_models/api_update_profile_model.dart';
import 'package:signup/core/constants/messages.dart';
import 'package:signup/core/models/api_models/api_action_status_message.dart';
import 'package:signup/core/models/api_models/api_status_message.dart';

class AppApiRepo extends BaseRepo {
  ApiAppGeneralRepo apiGeneralRepo = ApiAppGeneralRepo();
  ApiAppProfileRepo apiProfileRepo = ApiAppProfileRepo();
  final Map<String, dynamic> _resErrorBody = {
    "status": false,
    "message": msServerError
  };

  Future<ApiStatusMessageModel> checkServer() async {
    try {
      return ApiStatusMessageModel.fromJson(
          await apiGeneralRepo.getProfileExecute(wcCheckServer));
    } catch (_) {}
    return ApiStatusMessageModel.fromJson(_resErrorBody);
  }

  Future<ApiMakeAuthModel> makeAuth(Map<String, dynamic> body) async {
    try {
      return ApiMakeAuthModel.fromJson(
          await apiGeneralRepo.postProfileExecute(wcMakeAuthUrl, body));
    } catch (_) {}
    return ApiMakeAuthModel.fromJson(_resErrorBody);
  }

  Future<ApiGetHomeDataModel> getHomeData() async {
    try {
      return ApiGetHomeDataModel.fromJson(await apiProfileRepo
          .getProfileExecute(wcGetHomeUrl, getProfileHeader()));
    } catch (_) {}
    return ApiGetHomeDataModel.fromJson(_resErrorBody);
  }

  Future<ApiGetMembershipModel> getMembershipData(
      Map<String, dynamic> body) async {
    try {
      return ApiGetMembershipModel.fromJson(
          await apiProfileRepo.postProfileExecute(
              wcGetMembershipDataUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiGetMembershipModel.fromJson(_resErrorBody);
  }

  Future<ApiGetMembershipModel> freezeMembership(
      Map<String, dynamic> body) async {
    try {
      return ApiGetMembershipModel.fromJson(await apiProfileRepo
          .postProfileExecute(wcFreezeMembershipUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiGetMembershipModel.fromJson(_resErrorBody);
  }

  Future<ApiGetMembershipModel> unFreezeMembership(
      Map<String, dynamic> body) async {
    try {
      return ApiGetMembershipModel.fromJson(
          await apiProfileRepo.postProfileExecute(
              wcUnFreezeMembershipUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiGetMembershipModel.fromJson(_resErrorBody);
  }

  Future<ApiGetMemberMeasurementModel> getMembershipMeasurementData(
      Map<String, dynamic> body) async {
    try {
      return ApiGetMemberMeasurementModel.fromJson(
          await apiProfileRepo.postProfileExecute(
              wcGetMembershipMeasurementDataUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiGetMemberMeasurementModel.fromJson(_resErrorBody);
  }

  Future<ApiActionStatusMessageModel> insertMembershipMeasurementData(
      Map<String, dynamic> body) async {
    try {
      return ApiActionStatusMessageModel.fromJson(
          await apiProfileRepo.postProfileExecute(
              wcInsertMembershipMeasurementUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiActionStatusMessageModel.fromJson(_resErrorBody);
  }

  Future<ApiCheckMeasurementData> checkMemberMeasurementData(
      Map<String, dynamic> body) async {
    try {
      return ApiCheckMeasurementData.fromJson(
          await apiProfileRepo.postProfileExecute(
              wcCheckMembershipMeasurementUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiCheckMeasurementData.fromJson(_resErrorBody);
  }

  Future<ApiGetRatingsModel> getRatingsData(Map<String, dynamic> body) async {
    try {
      return ApiGetRatingsModel.fromJson(await apiProfileRepo
          .postProfileExecute(wcGetRatingsUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiGetRatingsModel.fromJson(_resErrorBody);
  }

  Future<ApiUpdateProfileModel> updateProfile(Map<String, dynamic> body) async {
    try {
      return ApiUpdateProfileModel.fromJson(await apiProfileRepo
          .postProfileExecute(wcUpdateProfileUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiUpdateProfileModel.fromJson(_resErrorBody);
  }

  Future<ApiActionStatusMessageModel> logout() async {
    try {
      return ApiActionStatusMessageModel.fromJson(await apiProfileRepo
          .getProfileExecute(wcLogoutUrl, getProfileHeader()));
    } catch (_) {}
    return ApiActionStatusMessageModel.fromJson(_resErrorBody);
  }

  Future<ApiGetFeedbackModel> getQuestionneireUrl(
      Map<String, dynamic> body) async {
    try {
      return ApiGetFeedbackModel.fromJson(await apiProfileRepo
          .postProfileExecute(wcGetQuestionneireUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiGetFeedbackModel.fromJson(_resErrorBody);
  }

  Future<ApiGetQuestionniereModel> getCustomerQuestionneireUrl(
      Map<String, dynamic> body) async {
    try {
      return ApiGetQuestionniereModel.fromJson(
          await apiProfileRepo.postProfileExecute(
              wcGetCustomerQuestionneireUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiGetQuestionniereModel.fromJson(_resErrorBody);
  }

  //Customer Update Pacer App Status

  Future<ApiActionStatusMessageModel> customerUpdatePacerAppStatusApi(
      Map<String, dynamic> body) async {
    try {
      return ApiActionStatusMessageModel.fromJson(
          await apiProfileRepo.postProfileJsonExecute(
              customerUpdatePacerAppStatusUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiActionStatusMessageModel.fromJson(_resErrorBody);
  }

  //Consutant assign to assitant

  Future<ApiAssignMembertoAssistantModel> assignMemberToAssistantApi(
      Map<String, dynamic> body) async {
    try {
      return ApiAssignMembertoAssistantModel.fromJson(
          await apiProfileRepo.postProfileJsonExecute(
              assignMemberToAssistantUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiAssignMembertoAssistantModel.fromJson(_resErrorBody);
  }

  //Change batch

  Future<ApiChangeBatchModel> changeBatchApi(Map<String, dynamic> body) async {
    try {
      return ApiChangeBatchModel.fromJson(await apiProfileRepo
          .postProfileJsonExecute(changeBatchUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiChangeBatchModel.fromJson(_resErrorBody);
  }

  //Renew membership

  Future<ApiRenewMembershipModel> renewMembershipApi(
      Map<String, dynamic> body) async {
    try {
      return ApiRenewMembershipModel.fromJson(
          await apiProfileRepo.postProfileJsonExecute(
              renewMembershipUrl, body, getProfileHeader()));
    } catch (_) {}
    return ApiRenewMembershipModel.fromJson(_resErrorBody);
  }

  Map<String, String> getProfileHeader() {
    return {
      WC_ACCESS_TOKKEN_KEY: mainModel!.userTokken,
      WC_USER_ID_KEY: mainModel!.userId,
    };
  }
}
