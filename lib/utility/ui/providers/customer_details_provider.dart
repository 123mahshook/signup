import 'package:signup/app/contracts/base_service.dart';
import 'package:signup/app/models/models/customer_model.dart';
import 'package:flutter/material.dart';

class CustomerDetailsProvider extends ChangeNotifier with BaseService {
  CustomerModel? customer;
  setCustomerData(CustomerModel cus) {
    customer = cus;
    notifyListeners();
  }
}
