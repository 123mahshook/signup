import 'package:cookee_common/Services/convert_service.dart';

class MembershipModel {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? phoneCountryCode;
  String? whatsappNumber;
  String? emergencyContact;
  String? gender;
  String? dateOfBirth;
  String? address;
  String? image;
  String? createdDate;
  int? enquiryId;
  String? city;
  String? email;
  String? customerTag;
  String? whatsappNumberCountryCode;
  String? emergencyContactCountryCode;
  int? cpId;
  int? packageId;
  int? packageAmount;
  int? discount;
  String? packageStartDate;
  String? packageExpiryDate;
  String? packageName;
  int? totalAmount;
  int? nutritionistId;
  String? nutritionistName;
  String? packageAdmissionDate;
  String? batchName;
  int? batchId;
  int? questionneireId;
  String? packageStatus;
  String? customerMeasurementLastDate;
  String? freezeId;
  String? freezeStartDate;
  String? freezeEndDate;
  bool? pacerApp;

  MembershipModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.phoneCountryCode,
      this.whatsappNumber,
      this.emergencyContact,
      this.gender,
      this.dateOfBirth,
      this.address,
      this.image,
      this.createdDate,
      this.enquiryId,
      this.city,
      this.email,
      this.customerTag,
      this.whatsappNumberCountryCode,
      this.emergencyContactCountryCode,
      this.cpId,
      this.packageId,
      this.packageAmount,
      this.discount,
      this.packageStartDate,
      this.packageExpiryDate,
      this.packageName,
      this.totalAmount,
      this.nutritionistId,
      this.nutritionistName,
      this.packageAdmissionDate,
      this.batchName,
      this.batchId,
      this.questionneireId,
      this.packageStatus,
      this.customerMeasurementLastDate,
      this.freezeId,
      this.freezeStartDate,
      this.freezeEndDate,
      this.pacerApp});

  factory MembershipModel.fromJson(Map<String, dynamic> json) =>
      MembershipModel(
          id: ConvertService.convertInt(json["id"]),
          firstName: ConvertService.convertString(json["first_name"]),
          lastName: ConvertService.convertString(json["last_name"]),
          phone: ConvertService.convertString(json["phone"]),
          phoneCountryCode:
              ConvertService.convertString(json["phone_country_code"]),
          whatsappNumber: ConvertService.convertString(json["whatsapp_number"]),
          emergencyContact:
              ConvertService.convertString(json["emergency_contact"]),
          gender: ConvertService.convertString(json["gender"]),
          dateOfBirth: ConvertService.convertString(json["date_of_birth"]),
          address: ConvertService.convertString(json["address"]),
          image: ConvertService.convertString(json["image"]),
          createdDate: ConvertService.convertString(json["created_date"]),
          enquiryId: ConvertService.convertInt(json["enquiry_id"]),
          city: ConvertService.convertString(json["city"]),
          email: ConvertService.convertString(json["email"]),
          customerTag: ConvertService.convertString(json["customer_tag"]),
          whatsappNumberCountryCode: ConvertService.convertString(
              json["whatsapp_number_country_code"]),
          emergencyContactCountryCode: ConvertService.convertString(
              json["emergency_contact_country_code"]),
          cpId: ConvertService.convertInt(json["cp_id"]),
          packageId: ConvertService.convertInt(json["package_id"]),
          packageAmount: ConvertService.convertInt(json["package_amount"]),
          discount: ConvertService.convertInt(json["discount"]),
          packageStartDate:
              ConvertService.convertString(json["package_start_date"]),
          packageExpiryDate:
              ConvertService.convertString(json["package_expiry_date"]),
          packageName: ConvertService.convertString(json["package_name"]),
          totalAmount: ConvertService.convertInt(json["total_amount"]),
          nutritionistId: ConvertService.convertInt(json["nutritionist_id"]),
          nutritionistName:
              ConvertService.convertString(json["nutritionist_name"]),
          packageAdmissionDate:
              ConvertService.convertString(json["package_admission_date"]),
          batchName: ConvertService.convertString(json["batch_name"]),
          batchId: ConvertService.convertInt(json["batch_id"]),
          questionneireId: ConvertService.convertInt(json["questionneire_id"]),
          packageStatus: ConvertService.convertString(json["status"]),
          customerMeasurementLastDate: ConvertService.convertString(
              json["customer_measurement_last_date"]),
          freezeId: ConvertService.convertString(json["freeze_id"]),
          freezeStartDate:
              ConvertService.convertString(json["freeze_start_date"]),
          freezeEndDate: ConvertService.convertString(json["freeze_end_date"]),
          pacerApp: ConvertService.convertBoolInt(json["pacer_app"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "phone_country_code": phoneCountryCode,
        "whatsapp_number": whatsappNumber,
        "emergency_contact": emergencyContact,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "address": address,
        "image": image,
        "created_date": createdDate,
        "enquiry_id": enquiryId,
        "city": city,
        "email": email,
        "customer_tag": customerTag,
        "whatsapp_number_country_code": whatsappNumberCountryCode,
        "emergency_contact_country_code": emergencyContactCountryCode,
        "cp_id": cpId,
        "package_id": packageId,
        "package_amount": packageAmount,
        "discount": discount,
        "package_start_date": packageStartDate,
        "package_expiry_date": packageExpiryDate,
        "package_name": packageName,
        "total_amount": totalAmount,
        "nutritionist_id": nutritionistId,
        "nutritionist_name": nutritionistName,
        "package_admission_date": packageAdmissionDate,
        "batch_name": batchName,
        "batch_id": batchId,
        "questionneire_id": questionneireId,
        "status": packageStatus,
        "customer_measurement_last_date": customerMeasurementLastDate,
        "freeze_id": freezeId,
        "freeze_start_date": freezeStartDate,
        "freeze_end_date": freezeEndDate,
        "pacer_app": pacerApp
      };

  static List<MembershipModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<MembershipModel> pros =
            list.map((data) => MembershipModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static MembershipModel? parseItem(json) {
    if (json != null) {
      return MembershipModel.fromJson(json);
    }
    return null;
  }

  MembershipModel copyItem() => MembershipModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      phoneCountryCode: phoneCountryCode,
      whatsappNumber: whatsappNumber,
      emergencyContact: emergencyContact,
      gender: gender,
      dateOfBirth: dateOfBirth,
      address: address,
      image: image,
      createdDate: createdDate,
      enquiryId: enquiryId,
      city: city,
      email: email,
      customerTag: customerTag,
      whatsappNumberCountryCode: whatsappNumberCountryCode,
      emergencyContactCountryCode: emergencyContactCountryCode,
      cpId: cpId,
      packageId: packageId,
      packageAmount: packageAmount,
      discount: discount,
      packageStartDate: packageStartDate,
      packageExpiryDate: packageExpiryDate,
      packageName: packageName,
      totalAmount: totalAmount,
      nutritionistId: nutritionistId,
      nutritionistName: nutritionistName,
      packageAdmissionDate: packageAdmissionDate,
      batchName: batchName,
      batchId: batchId,
      questionneireId: questionneireId,
      packageStatus: packageStatus,
      customerMeasurementLastDate: customerMeasurementLastDate,
      freezeId: freezeId,
      freezeStartDate: freezeStartDate,
      freezeEndDate: freezeEndDate,
      pacerApp: pacerApp);

  List<MembershipModel> copyItems(List<MembershipModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static MembershipModel initData() => MembershipModel(
      id: 0,
      firstName: "",
      lastName: "",
      phone: "",
      phoneCountryCode: "",
      whatsappNumber: "",
      emergencyContact: "",
      gender: "",
      dateOfBirth: "",
      address: "",
      image: "",
      createdDate: "",
      enquiryId: 0,
      city: "",
      email: "",
      customerTag: "",
      whatsappNumberCountryCode: "",
      emergencyContactCountryCode: "",
      cpId: 0,
      packageId: 0,
      packageAmount: 0,
      discount: 0,
      packageStartDate: "",
      packageExpiryDate: "",
      packageName: "",
      totalAmount: 0,
      nutritionistId: 0,
      nutritionistName: "",
      packageAdmissionDate: "",
      batchName: "",
      batchId: 0,
      questionneireId: 0,
      packageStatus: "",
      customerMeasurementLastDate: "",
      freezeId: "",
      freezeStartDate: "",
      freezeEndDate: "",
      pacerApp: false);
}
