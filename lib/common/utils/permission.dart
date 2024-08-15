import 'dart:io';
import 'package:go_desk_workplace/common/premission/i_grant_premission_strategy.dart';
import 'package:permission_handler/permission_handler.dart';

// camera permission
class GrantPermissionCameraStrategy extends IGrantPermissionStrategy {
  GrantPermissionCameraStrategy() : super(Permission.camera);
}

// storage permission
class GrantPermissionStorageStrategy extends IGrantPermissionStrategy {
  GrantPermissionStorageStrategy()
      : super(Platform.isAndroid ? Permission.storage : Permission.photos);
}

/*class GrantPermissionManageStorageStrategy extends IGrantPermissionStrategy {
  GrantPermissionManageStorageStrategy()
      : super(Permission.manageExternalStorage);
}*/

// audio permission
class GrantPermissionAudioStrategy extends IGrantPermissionStrategy {
  GrantPermissionAudioStrategy() : super(Permission.microphone);
}

// location permission
class GrantPermissionLocationStrategy extends IGrantPermissionStrategy {
  GrantPermissionLocationStrategy() : super(Permission.location);
}
