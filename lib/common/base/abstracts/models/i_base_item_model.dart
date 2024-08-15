/// all project model have to extend this widgets model
/// if model class is single json data extend this abstract
/// or use IBaseModel for list of json data
abstract class IBaseItemModel<T> {
  /// use to serialize the model class to json
  Map<String, dynamic> toJson();

  /// use to deserialize the json to model class
  T fromJson(Map<String, dynamic> json);

  /// for identify the class
  /// to use to create instance of the model
  /// this can avoid bucket load of repositories and services
  String getClassName() {
    return (T).toString();
  }
}
