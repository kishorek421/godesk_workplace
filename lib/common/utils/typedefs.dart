typedef OnSaved<T> = void Function(T? value);
typedef MoveCallback = void Function();
typedef SaveBtnCallback = void Function({
  required bool visibility,
  required bool canGoNext,
});
typedef ShowToastCallback = void Function({required String msg});
typedef RefreshProfileDataCallback = void Function();
typedef UpdateBasicCompletedStatusCallback = void Function(bool status);
// for permission
typedef OnPermanentlyDenied = void Function();
typedef OnGranted = void Function();
typedef OnUploadProgressCallback = void Function(
  int progress,
  int total,
);
