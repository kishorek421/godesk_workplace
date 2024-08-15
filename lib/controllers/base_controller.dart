import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/constants/app_themes.dart';

class BaseHomePageController<T> extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxList orgTypeDropDownItems = [
    'Start-up',
    'Street Commerce',
  ].obs;
  final RxString selectedOrgType = "".obs;
  final RxList orgCategoryDropDownItems = [
    'Organization 1',
    'Organization 2',
    'Organization 3',
    'Organization 4',
  ].obs;

  final RxList orgAreaDropDownItems =
      ['Area 1', 'Area 2', 'Area 3', 'Area 4'].obs;
  final RxList orgCityDropDownItems =
      ['City 1', 'City 2', 'City 3', 'City 4'].obs;
  final RxList orgStateDropDownItems =
      ['State 1', 'State 2', 'State 3', 'State 4'].obs;
  final RxList orgCountryDropDownItems =
      ['Country 1', 'Country 2', 'Country 3', 'Country 4'].obs;
  final RxList orgSizeDropDownItems =
      ['Below 50', '100 - 200 ', '200 - 500', 'Above 500'].obs;
  final String selectedDropDownItem = '';
  final streetAddressAreaController = TextEditingController();
  final pincodeController = TextEditingController();
  RxString selectedArea = ''.obs;
  RxString selectedCity = ''.obs;
  RxString selectedState = ''.obs;
  RxString selectedCountry = ''.obs;
  final organizationEditPageTextController = TextEditingController();
  final organizationName = TextEditingController();

  //final adminFirstName = TextEditingController();
  //final adminLastName = TextEditingController();
  // var category = ''.obs;
  // var size = ''.obs;
  // var type = ''.obs;
  // final gstNo = TextEditingController();
  // final description = TextEditingController();
  // final emailId = TextEditingController();
  // final organizationMobileNo = TextEditingController();
  // final alternateMobileNo = TextEditingController();
  // final personalMobileNo = TextEditingController();
  //
  final TextStyle mainCellTextStyle = const TextStyle(
    fontSize: 18,
    fontFamily: AppThemes.fontFamilyOpenSans,
    fontWeight: AppThemes.fontSemiBold,
    color: AppColors.primaryColor,
  );
  final TextStyle secondaryCellTextStyle = const TextStyle(
    fontSize: 18,
    fontFamily: AppThemes.fontFamilyOpenSans,
    fontWeight: AppThemes.fontRegular,
    color: AppColors.textColor,
  );
  final TextStyle serialNoCellTextStyle = const TextStyle(
    fontSize: 18,
    fontFamily: AppThemes.fontFamilyOpenSans,
    fontWeight: AppThemes.fontRegular,
    color: AppColors.blueColor,
  );

// void saveFormData() {
//   organizationDetails.update((val) {
//     val?.orgName = organizationName.text;
//     val?.firstName = adminFirstName.text;
//     val?.lastName = adminLastName.text;
//     val?.typeOfOrgDetails = type.value;
//     val?.categoryOfOrgDetails = category.value;
//     val?.sizeOfOrgDetails = size.value;
//     val?.gstIn = gstNo.text;
//     val?.description = description.text;
//     val?.orgMobile = organizationMobileNo.text;
//     val?.address = streetAddressAreaController.text;
//     val?.pincodeDetails = pincodeController.text;
//     val?.areaDetails = selectedArea.value;
//     val?.cityDetails = selectedCity.value;
//     val?.stateDetails = selectedState.value;
//     val?.countryDetails = selectedCountry.value;
//   });
// }
}
