import 'package:go_desk_workplace/common/base/abstracts/services/i_base_service.dart';
import 'package:go_desk_workplace/common/base/models/base_response_model.dart';
import 'package:go_desk_workplace/models/geolocations/area_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/city_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/country_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/pincode_list_model.dart';
import 'package:go_desk_workplace/models/geolocations/state_list_model.dart';

abstract class IGeoLocationsApiServices extends IBaseService {
  Future<BaseResponseModel<CountryListModel?>> getCountryList();

  Future<BaseResponseModel<AreaListDropDownModel?>> getAreaList();

  Future<BaseResponseModel<CityListModel?>> getCityList();

  Future<BaseResponseModel<StateListModel?>> getStateList();

  Future<BaseResponseModel<PincodeListModel?>> getPincodeList();
}
