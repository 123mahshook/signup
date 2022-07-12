import 'package:signup/app/contracts/base_repo.dart';
import 'package:signup/app/models/models/membership_model.dart';
import 'package:signup/app/models/models/rating_model.dart';

class RatingsRepo extends BaseRepo {
  insertData(List<RatingModel> data) {
    for (var en in data) {
      insertRow(en);
    }
  }

  insertRow(RatingModel row) {
    try {
      int ind = appModel!.ratings.indexWhere((e) => e.id == row.id);
      if (ind >= 0) {
        appModel!.ratings[ind] = row;
      } else {
        appModel!.ratings.add(row);
      }
    } catch (_) {}
  }
}
