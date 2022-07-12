import 'package:signup/core/constants/preference_config_constants.dart';
import 'package:signup/core/repositeries/preference/contracts/preference_repo_contract.dart';

class PreferenceRepo extends PreferenceRepoContract {
  setUserTokken(String tokken) async {
    mainModel?.userTokken = "Token $tokken";
    await prefCoreRepo.setString(pfUserTokkenKey, tokken);
  }

  setUserId(String userId) async {
    mainModel?.userId = userId;
    await prefCoreRepo.setString(pfUserIdKey, userId);
  }

  Future<String> getUserTokken() async {
    String tokken = await prefCoreRepo.getString(pfUserTokkenKey);
    tokken = "Token " + tokken;
    mainModel?.userTokken = tokken;
    return tokken;
  }

  Future<String> getUserId() async {
    String userId = await prefCoreRepo.getString(pfUserIdKey);
    mainModel?.userId = userId;
    return userId;
  }
}
