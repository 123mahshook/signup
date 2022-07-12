import 'package:signup/app/contracts/base_repo.dart';
import 'package:signup/app/models/models/membership_model.dart';

class MembershipRepo extends BaseRepo {
  insertData(List<MembershipModel> data) {
    for (var en in data) {
      insertRow(en);
    }
  }

  insertRow(MembershipModel row) {
    try {
      int ind = appModel!.membership.indexWhere((e) => e.id == row.id);
      if (ind >= 0) {
        appModel!.membership[ind] = row;
      } else {
        appModel!.membership.add(row);
      }
    } catch (_) {}
  }

  List<MembershipModel> search(String query) {
    List<MembershipModel> data = [];
    try {
      for (var m in appModel!.membership) {
        if (m.firstName!.toLowerCase().contains(query.toLowerCase()) ||
            m.lastName!.toLowerCase().contains(query.toLowerCase()) ||
            m.phone!.toLowerCase().contains(query.toLowerCase()) ||
            //country code search
            m.phoneCountryCode!.toLowerCase().contains(query.toLowerCase()) ||
            //first name and last name
            (m.firstName!.toLowerCase() + " " + m.lastName!.toLowerCase())
                .contains(query.toLowerCase()) ||
            //first name and last name
            (m.firstName!.toLowerCase() + "" + m.lastName!.toLowerCase())
                .contains(query.toLowerCase()) ||
            //country code + space +phone number
            (m.phoneCountryCode!.toLowerCase() + " " + m.phone!.toLowerCase())
                .contains(query.toLowerCase()) ||
            //country code+phone number
            (m.phoneCountryCode!.toLowerCase() + m.phone!.toLowerCase())
                .contains(query.toLowerCase()) ||
            //country code+phone number
            (m.phoneCountryCode!.toLowerCase() + " " + m.phone!.toLowerCase())
                .contains(query.toLowerCase()) ||
            //country code+phone number
            (m.phoneCountryCode!.toLowerCase() + m.phone!.toLowerCase())
                .replaceAll(' ', '')
                .contains(query.replaceAll(' ', '').toLowerCase()) ||
            // name with space
            (m.firstName!.toLowerCase() + m.lastName!.toLowerCase())
                .replaceAll(' ', '')
                .contains(query.replaceAll(' ', '').toLowerCase())) {
          data.add(m);
        }
      }
    } catch (_) {}
    return data;
  }

  List<MembershipModel> getRecentMemberships({int count = 10}) {
    return appModel!.membership.take(count).toList();
  }

  insertPacerStatusById(int id, bool pacerStatus) {
    try {
      int index =
          appModel!.membership.indexWhere((element) => element.id == id);
      if (index >= 0) {
        appModel!.membership[index].pacerApp = pacerStatus;
      }
    } catch (_) {}
  }

  updateRow(MembershipModel row) {
    try {
      int ind = appModel!.membership.indexWhere((e) => e.id == row.id);
      if (ind >= 0) {
        appModel!.membership[ind] = row;
      }
    } catch (_) {}
  }
}
