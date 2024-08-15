

import 'package:go_desk_workplace/common/base/abstracts/models/i_base_item_model.dart';

/// all project model have to extend this widgets model
/// if model class is list of json data extend this abstract
/// or use IBaseItemModel for single json data
abstract class IBaseModel<T, R extends IBaseItemModel> {
  /// use to deserialize the list of json to model class
  T fromList(List<dynamic> jsonLst);

  /// use to deserialize the string(list of json) to model class
  T fromString(String str);

  /// use to serialize the model class to list of json
  List<Map<String, dynamic>> toList();

  /// for identify the class
  /// to use to create instance of the model
  /// this can avoid bucket load of repositories and services
  String getClassName() {
    return (T).toString();
  }
}
