import 'package:cookee_api/repo/api_app_general_repo.dart';
import 'package:cookee_api/repo/api_appprofile_repo.dart';
import 'package:signup/app/config/app_module_container.dart';
import 'package:signup/app/repositeries/api/app_api_repo.dart';
import 'package:signup/app/repositeries/app/app_model.dart';
import 'package:signup/core/config/module_container.dart';
import 'package:signup/core/repositeries/app/main_model.dart';
import 'package:signup/core/repositeries/preference/preference_repo.dart';

abstract class BaseService {
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
  AppModel? appModel = AppModuleContainer.moduleInjector?.get<AppModel>();
  ApiAppGeneralRepo apiAppGeneralRepo = ApiAppGeneralRepo();
  ApiAppProfileRepo apiAppProfileRepo = ApiAppProfileRepo();
  AppApiRepo appApiRepo = AppApiRepo();
  PreferenceRepo prefRepo = PreferenceRepo();
}
