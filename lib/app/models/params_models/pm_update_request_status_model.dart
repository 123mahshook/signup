class PmUpdateRequestStatusModel{
    String? status;
    String? rowId;

    PmUpdateRequestStatusModel({this.status,this.rowId});

    Map<String, dynamic> toJson() => {
         "status": status,
         "row_id":rowId
      };
  }