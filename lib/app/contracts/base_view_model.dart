import 'package:signup/core/constants/messages.dart';
import 'package:flutter/material.dart';
import 'package:signup/app/config/app_module_container.dart';
import 'package:signup/core/config/module_container.dart';
import 'package:signup/app/repositeries/app/app_model.dart';
import 'package:signup/core/repositeries/app/main_model.dart';
import 'package:signup/utility/ui/common/common_navigate.dart';

abstract class BaseViewModel {
  BuildContext? parentContext;
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
  AppModel? appModel = AppModuleContainer.moduleInjector?.get<AppModel>();

  void setContext(BuildContext context) {
    this.parentContext = context;
  }

  void dispose();

  void handleFailledRequest(String message) {
    if (message == msNoInternetConnection) {
      CommonNavigate(parentContext: this.parentContext!).navigateNoInternet();
    } else if (message == msServerError) {
      CommonNavigate(parentContext: this.parentContext!).navigateServerError();
    } else {
      CommonNavigate(parentContext: this.parentContext!).navigateSplashScreen();
    }
  }
}
