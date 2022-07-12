import 'package:signup/app/config/app_module_container.dart';
import 'package:signup/app/repositeries/app/app_model.dart';
import 'package:signup/core/config/module_container.dart';
import 'package:signup/core/repositeries/app/main_model.dart';

abstract class BaseRepo {
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
  AppModel? appModel = AppModuleContainer.moduleInjector?.get<AppModel>();
}
