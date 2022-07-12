import 'package:intl/intl.dart';
import 'package:signup/app/contracts/base_repo.dart';

class AppUtilityRepo extends BaseRepo {
  //Ralph lopez => RL
  String getnameShort(String name) {
    List<String> nameList = <String>[];
    String finalString = "";
    String firstLetter = "";
    String secondLetter = "";
    nameList = name.split(' ');
    int count = 0;
    //print(nameList);
    try {
      if (nameList.length > 1) {
        if (nameList[1].isEmpty) {
          nameList.removeAt(1);
        }
      }

      //if (nameList.length > 1) {
      for (var item in nameList) {
        if (count == 0) {
          firstLetter = item[0];
        } else if (count == 1) {
          if (item.length > 2) {
            secondLetter = item[0];
          }
        }
        count++;
      }
    } catch (_) {
      // TODO
    }
    //}
    finalString = firstLetter + secondLetter;
    return finalString.toUpperCase();
  }

  String dateDDMMYYYYformat(String data) {
    String dateR = "";
    try {
      DateTime date = DateTime.parse(data);
      dateR = DateFormat("dd-MM-yyyy").format(date).toString();
    } catch (_) {
      // TODO
    }
    return dateR;
  }
}
