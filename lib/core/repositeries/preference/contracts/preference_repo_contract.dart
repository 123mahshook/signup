import 'package:cookee_prefs/Repositeries/preference_core_repo.dart';
import 'package:signup/core/config/module_container.dart';
import 'package:signup/core/repositeries/app/main_model.dart';

abstract class PreferenceRepoContract {
  PreferenceCoreRepo prefCoreRepo = PreferenceCoreRepo();
  MainModel? mainModel = ModuleContainer.moduleInjector?.get<MainModel>();
}
