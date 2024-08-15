import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/common/constants/api_endpoints.dart';
import 'package:go_desk_workplace/models/geolocations/area_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/country_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/city_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/pincode_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/state_list_model.dart';
import 'package:go_desk_workplace/services/api/geo_location/i_geo_locations_api_services.dart';


class GeoLocationApiService extends IGeoLocationsApiServices {
  @override
  Future<BaseResponseModel<CountryListModel>> getCountryList() async {
    var token = await getToken();
    print(token);

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }
    var response = await get(
      ApiEndpoints.getCountryList,
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<CountryListModel>(body);
    } else {
      return BaseResponseModel(
        data: CountryListModel.fromJson(body),
      );
    }
  }

  @override
  Future<BaseResponseModel<AreaListDropDownModel?>> getAreaList() async {
    var token = await getToken();
    print(token);

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }
    var response = await get(
      ApiEndpoints.getAreaList,
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<AreaListDropDownModel>(body);
    } else {
      return BaseResponseModel(
        data: AreaListDropDownModel.fromJson(body),
      );
    }
  }

  @override
  Future<BaseResponseModel<CityListModel?>> getCityList() async {
    var token = await getToken();
    print(token);

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }
    var response = await get(
      ApiEndpoints.getCityList,
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<CityListModel>(body);
    } else {
      return BaseResponseModel(
        data: CityListModel.fromJson(body),
      );
    }
  }

  @override
  Future<BaseResponseModel<StateListModel?>> getStateList() async {
    var token = await getToken();
    print(token);

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }
    var response = await get(
      ApiEndpoints.getStateList,
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<StateListModel>(body);
    } else {
      return BaseResponseModel(
        data: StateListModel.fromJson(body),
      );
    }
  }

  @override
  Future<BaseResponseModel<PincodeListModel?>> getPincodeList() async {
    var token = await getToken();
    print(token);

    if (token == null) {
      return BaseResponseModel(
        status: 401,
        message: "Failed to fetch token",
        success: false,
      );
    }
    var response = await get(
      ApiEndpoints.getPincodeList,
      headers: {"Authorization": "Bearer $token"},
    );

    var body = response.body ?? {};
    var data = body["data"];
    var success = body["success"];
    if (response.status.hasError ||
        success == null && !(success as bool) ||
        data == null) {
      return handleErrorResponse<PincodeListModel>(body);
    } else {
      return BaseResponseModel(
        data: PincodeListModel.fromJson(body),
      );
    }
  }
}
