// ignore_for_file: non_constant_identifier_names
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_desk_workplace/common/constants/app_colors.dart';
import 'package:go_desk_workplace/common/texts/primary_text.dart';
import 'package:go_desk_workplace/common/widgets/bottom_sheets/base_bottom_sheet.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickerBottomSheet extends StatefulWidget {
  //final FileType fileType;

  const FilePickerBottomSheet({
    super.key,
  });

  @override
  State<FilePickerBottomSheet> createState() => _FilePickerBottomSheetState();
}

class _FilePickerBottomSheetState extends State<FilePickerBottomSheet> {
  final imgExes = [
    "jpg",
    "jpeg",
    "png",
  ];
  final picker = ImagePicker();
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      horizontalPadding: 5.0,
      height: 200,
      verticalPadding: 10.0,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: PrimaryText(
                  "Picker Options",
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: pickFromCamera,
                        child: const Icon(
                          Icons.camera_enhance_sharp,
                          size: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const PrimaryText(
                        "Camera",
                        fontColor: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: pickFromGallery,
                        child: const Icon(
                          Icons.photo,
                          size: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const PrimaryText(
                        "Gallery",
                        fontColor: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickFromCamera() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        _cropImage(File(pickedFile.path));
      }
    } else {
      _showPermissionDeniedDialog();
    }
  }

  Future<void> pickFromGallery() async {
    final status = await Permission.photos.request();
    if (status.isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _cropImage(File(pickedFile.path));
      }
    } else {
      _showPermissionDeniedDialog();
    }
  }

  Future<void> _cropImage(File imageFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: AppColors.primaryColor,
          toolbarWidgetColor: AppColors.gray200Color,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9
          ],
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    if (croppedFile != null) {
      setState(() {
        this.imageFile = File(croppedFile.path);
      });
      Navigator.of(context).pop(imageFile);
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Permission Denied"),
        content: const Text(
            "Please grant the necessary permissions to use this feature."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}

// import 'dart:io';
//
// import 'package:camera/camera.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:go_desk_workplace/common/base/widgets/base_bottom_sheet.dart';
// import 'package:go_desk_workplace/common/constants/app_colors.dart';
// import 'package:go_desk_workplace/common/logger/app_logger.dart';
// import 'package:go_desk_workplace/common/utils/permission.dart';
// import 'package:go_desk_workplace/common/widgets/texts/primary_text.dart';
// import 'package:go_desk_workplace/pages/dialogs/alerts/permission_alert.dart';
// import 'package:go_desk_workplace/pages/home/pages/children/camera_page.dart';
// import 'package:go_desk_workplace/pages/home/widgets/snack_bar.dart';
// import 'package:go_desk_workplace/pages/icons/primary_icon.dart';
// import 'package:image_cropper/image_cropper.dart';
//
//
// class FilePickerBottomSheet extends StatefulWidget {
//   //final FileType fileType;
//
//   FilePickerBottomSheet({Key? key, }) : super(key: key);
//
//   @override
//   State<FilePickerBottomSheet> createState() => _FilePickerBottomSheetState();
// }
//
// class _FilePickerBottomSheetState extends State<FilePickerBottomSheet> {
//   final imgExes = [
//     "jpg",
//     "jpeg",
//     "png",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseBottomSheet(
//       horizontalPadding: 5.0,
//       height: 200,
//       verticalPadding: 10.0,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 15.0,
//           ),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: PrimaryText(
//                   "Picker Options",
//                   fontSize: 18,
//
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//                   InkWell(
//                     onTap: () async {
//                       await GrantPermissionCameraStrategy().request(
//                         onPermanentlyDenied: () {
//                           // launch dialog, make user go to app settings
//                           iLogger("permission denied");
//                           showPermissionAlertDialog(
//                             requestMsg:
//                             "Camera access needed. Go to Android settings, tap App permissions and tap Allow.",
//                           );
//                         },
//                         onGranted: () async {
//                           // we have passed! with the camera permission, now launch the feature.
//                           await availableCameras().then((value) async {
//                             if (value.isNotEmpty) {
//                               var picPath = await Get.to(() => CameraPage(
//                                 cameras: value,
//                                 isRearCameraSelected: false,
//                               ));
//                               Get.back(result: picPath);
//                             }
//                           }).catchError((e) {
//                             eLogger(e);
//                           }).onError((error, stackTrace) {
//                             eLogger(error.toString());
//                           });
//                         },
//                       );
//                     },
//                     child: Column(
//                       children: const [
//                         PrimaryIcon(
//                           Icons.camera_alt_rounded,
//                           bgColor: Colors.transparent,
//                           borderColor: AppColors.primaryColor,
//                           iconColor: AppColors.primaryColor,
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         PrimaryText(
//                           "Camera",
//                           fontColor: AppColors.primaryColor,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 30,
//                   ),
//                   InkWell(
//                     onTap: () async {
//                       await GrantPermissionStorageStrategy().request(isFilePicker: true,
//                         onPermanentlyDenied: () {
//                           // launch dialog, make user go to app settings
//                           iLogger("permission denied");
//                           showPermissionAlertDialog(
//                             requestMsg:
//                             "Storage access needed. Go to ${Platform.isIOS?"IOS":"Android"} settings, tap App permissions and tap Allow.",
//                           );
//                         },
//                         onGranted: () async {
//                           // we have passed! with the storage permission, now launch the feature.
//                           _pickFromDirectory();
//                         },
//                       );
//                     },
//                     child: Column(
//                       children: const [
//                         PrimaryIcon(
//                           Icons.snippet_folder_sharp,
//                           bgColor: Colors.transparent,
//                           borderColor: AppColors.primaryColor,
//                           iconColor: AppColors.primaryColor,
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         PrimaryText(
//                           "Directory",
//                           fontColor: AppColors.primaryColor,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _pickFromDirectory() async {
//     FilePickerResult? result;
//     if (widget == FileType.image) {
//       result = await FilePicker.platform.pickFiles(
//         type: FileType.image,
//       );
//     } else {
//       result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ["jpg", "jpeg", "png", "pdf"],
//       );
//     }
//
//     if (result != null) {
//       PlatformFile file = result.files.first;
//       if (file.size > 2000000) {
//         showSnackBar("File size exceeds more than 2mb");
//       } else {
//         var path = file.path;
//         var exe = file.extension;
//         if (path != null && path.isNotEmpty) {
//           if (imgExes.contains(exe)) {
//             _cropImgAndGoBack(path as File);
//           } else {
//             Get.back(result: path);
//           }
//           dLogger("path -> $path");
//         } else {
//           showSnackBar("Couldn't able to process this file");
//         }
//       }
//     }
//   }
//
//   _cropImgAndGoBack(File imgFile) async {
//     CroppedFile? croppedFile = await ImageCropper().cropImage(
//       sourcePath: imgFile.path,
//     aspectRatio: CropAspectRatio(ratioX:1.0 , ratioY:1.0 ),
//
//
//     //   aspectRatioPresets: Platform.isAndroid
//     //       ? [
//     //     CropAspectRatioPreset.square,
//     //     CropAspectRatioPreset.ratio3x2,
//     //     CropAspectRatioPreset.original,
//     //     CropAspectRatioPreset.ratio4x3,
//     //     CropAspectRatioPreset.ratio16x9
//     //   ]
//     //       : [
//     //     CropAspectRatioPreset.original,
//     //     CropAspectRatioPreset.square,
//     //     CropAspectRatioPreset.ratio3x2,
//     //     CropAspectRatioPreset.ratio4x3,
//     //     CropAspectRatioPreset.ratio5x3,
//     //     CropAspectRatioPreset.ratio5x4,
//     //     CropAspectRatioPreset.ratio7x5,
//     //     CropAspectRatioPreset.ratio16x9
//     //   ],
//     //   uiSettings: [
//     //   AndroidUiSettings(
//     //   toolbarTitle: 'Cropper',
//     //   toolbarColor: AppColors.primaryColor,
//     //   toolbarWidgetColor: AppColors.gray100Color,
//     //   initAspectRatio: CropAspectRatioPreset.original,
//     //   lockAspectRatio: false,
//     // ),
//     //     IOSUiSettings(
//     // title: 'Cropper',
//     // ),
//     // WebUiSettings(
//     // context: context,
//     // ),],
//     );
//
//     iLogger("going back with ${croppedFile?.path}");
//
//     Get.back(result: croppedFile?.path ?? "");
//   }
// }
