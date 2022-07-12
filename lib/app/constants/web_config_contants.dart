library web_config_constants;

///urls
//const wcBaseUrl = "http://127.0.0.1:8000/api/v1/dietician/";
//const wcBaseUrl = "http://staging-servers.com/atp/api/v1/dietician/";
//const wcBaseUrl = "http://51.210.202.148/atp/api/v1/dietician/";
const wcBaseUrl = "http://127.0.0.1:8000/api/v1/dietician/";
const wcCheckServer = wcBaseUrl + "check_server";
const wcGetHomeUrl = wcBaseUrl + "get_home_data";
const wcMakeAuthUrl = wcBaseUrl + "login";
const wcGetMembershipDataUrl = wcBaseUrl + "get_membership_data";
const wcGetMembershipMeasurementDataUrl =
    wcBaseUrl + "get_customer_measurement";
const wcInsertMembershipMeasurementUrl =
    wcBaseUrl + "insert_customer_measurement";
const wcGetRatingsUrl = wcBaseUrl + "get_rating_data";
const wcUpdateProfileUrl = wcBaseUrl + "update_profile";
const wcLogoutUrl = wcBaseUrl + "logout";
const wcCheckMembershipMeasurementUrl = wcBaseUrl + "check_member_measurement";
const wcFreezeMembershipUrl = wcBaseUrl + "membership_freeze";
const wcUnFreezeMembershipUrl = wcBaseUrl + "membership_unfreeze";
const wcGetQuestionneireUrl = wcBaseUrl + "generate_questionneire_url";
const wcGetCustomerQuestionneireUrl =
    wcBaseUrl + "get_customer_questionneire_data";
const customerUpdatePacerAppStatusUrl =
    wcBaseUrl + "update_customer_pacer_app_status";
const assignMemberToAssistantUrl = wcBaseUrl + "assign_member_to_assistant";
const renewMembershipUrl = wcBaseUrl + "renew_membership";
const changeBatchUrl = wcBaseUrl + "change_batch";
