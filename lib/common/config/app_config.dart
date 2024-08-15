import 'package:go_desk_workplace/common/enums/env_enum.dart';

class AppConfig {
  AppConfig._();

  // create module wise isMock
  static const bool isCustomerMock = false;

  // control environments with this env
  static const EnvEnum env = EnvEnum.dev;

  // config baseURL based on env
  static const String _devBaseUrl = "http://43.205.35.224:8089";

  static const String _qaBaseUrl = "http://43.205.35.224:8089";

  static const String _prodBaseUrl = "http://43.205.35.224:8089";

  static const String mainBaseUrl = env == EnvEnum.prod
      ? _prodBaseUrl
      : env == EnvEnum.qa
      ? _qaBaseUrl
      : _devBaseUrl;

  // write all credential here

}