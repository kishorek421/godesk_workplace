import 'package:go_desk_workplace/common/config/app_config.dart';

class ApiEndpoints {
  ApiEndpoints._();

  // auth
  static const String login = "${AppConfig.mainBaseUrl}/login/user_login";
  static const String validateToken = "${AppConfig.mainBaseUrl}/login/validate";
  static const String refreshToken =
      "${AppConfig.mainBaseUrl}/login/refresh_token";

  // customer
  static String getCustomerDetailsById =
      '${AppConfig.mainBaseUrl}/customers/view?id=30a0c5bc-64e1-40c8-8e9b-6b062e9adcfb';

  // customer lead
  static String getCustomerLeadDetailsById =
      '${AppConfig.mainBaseUrl}/customers/leads/view';
  static String updateCustomerLeadDetails =
      "${AppConfig.mainBaseUrl}/customers/leads/update";

  // tickets
  static const String raiseTicket =
      "${AppConfig.mainBaseUrl}/tickets/raiseTicket";
  static const String getTicketDetails =
      "${AppConfig.mainBaseUrl}/tickets/view";
  static const String getTicketListByStatusKey =
      "${AppConfig.mainBaseUrl}/tickets/customers/getTicketsByStatusKey";

  // configurations
  static const String getConfigurationsListByCategoryIn =
      "${AppConfig.mainBaseUrl}/configurations/getConfigurationsListByCategoryIn";
  static const String getConfigurationsByCategory =
      "${AppConfig.mainBaseUrl}/configurations/getConfigurationsForDropdown";

// assets
  static const String getAssetTypeList =
      "${AppConfig.mainBaseUrl}/assets/assetType/getAssetTypesListWithoutPagination";
  static const String getAssetSubTypeList =
      "${AppConfig.mainBaseUrl}/assets/assetSubType/getAssetSubTypesListWithoutPagination";
  static const String getAssetModelList =
      "${AppConfig.mainBaseUrl}/assets/assetModel/getAssetModelsListWithoutPagination";
  static const String getAssetIsUseList =
      "${AppConfig.mainBaseUrl}/assets/assetsInUse/getCustomerAssetsInUseListBySerialNoSearch";
  static const String getAssetMasterList =
      "${AppConfig.mainBaseUrl}/assets/assetMaster/getAssetMastersListWithoutPagination";
  static const String getIssueTypesList =
      "${AppConfig.mainBaseUrl}/assets/assetIssueType/getIssueTypesList";

  // geolocations
  static const String getCountryList =
      "${AppConfig.mainBaseUrl}/geolocations/countries/getAllCountriesForDropdown";
  static const String getAreaList =
      "${AppConfig.mainBaseUrl}/geolocations/areas/getAllAreasForDropdown";
  static const String getCityList =
      "${AppConfig.mainBaseUrl}/geolocations/cities/getAllCitiesForDropdown";
  static const String getStateList =
      "${AppConfig.mainBaseUrl}/geolocations/states/getAllStatesForDropdown";
  static const String getPincodeList =
      "${AppConfig.mainBaseUrl}/geolocations/pincodes/getAllPincodesForDropdown";

  // add Devices
  static const String getAssetDetails =
      "${AppConfig.mainBaseUrl}/assets/getAssetDetails";
  static const String addAsset = "${AppConfig.mainBaseUrl}/assets/addAsset";
}
