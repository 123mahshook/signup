import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/models/membership_model.dart';
import 'package:signup/app/repositeries/app/membership_repo.dart';

class SearchMembershipService extends BaseService {
  List<MembershipModel> search(String query) {
    List<MembershipModel> data = [];
    data = MembershipRepo().search(query);
    return data;
  }
}
