import 'package:device_info_plus/device_info_plus.dart';
import 'package:go_desk_workplace/common/logger/app_logger.dart';
import 'package:go_desk_workplace/common/utils/typedefs.dart';

import 'package:permission_handler/permission_handler.dart';

/// widgets class for permission handler
/// request can request user to allow the permission
/// if fails exception will happen based on that
/// show manual permission allow dialog
abstract class IGrantPermissionStrategy {
  Permission permission;

  IGrantPermissionStrategy(this.permission);

  Future<void> request({
    required final OnPermanentlyDenied onPermanentlyDenied,
    required final OnGranted onGranted,
    final bool isFilePicker = false,
  }) async {
    iLogger("permission$permission ${await getSdkInt()}");
    // PermissionStatus status = await (permission == Permission.storage && await getSdkInt() > 32 ?Permission.photos:permission).status;
    if (await getSdkInt() > 32 && isFilePicker) {
      permission = Permission.photos;
    }
    PermissionStatus status = await permission.status;
    iLogger("GrantPermissionStrategy status: $status");

    if (!status.isLimited && !status.isGranted) {
      final PermissionStatus result = await permission.request();
      iLogger("denied status: $status");
      if (result.isPermanentlyDenied) {
        onPermanentlyDenied.call();
        return;
      }
      if (!result.isGranted) {
        return;
      }
    }
    onGranted.call();
  }

  getSdkInt() async {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    int? sdkInt = androidInfo.version.sdkInt;
    return sdkInt;
  }
}
