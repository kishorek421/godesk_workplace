import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_desk_workplace/common/logger/app_logger.dart';
import 'package:image_cropper/image_cropper.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  final bool isRearCameraSelected;

  const CameraPage({
    Key? key,
    required this.cameras,
    required this.isRearCameraSelected,
  }) : super(key: key);

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  late CameraController controller;
  bool _isCameraInitialized = false;
  bool _isRearCameraSelected = true;

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (_isCameraInitialized) {
      final previousCameraController = controller;

      /// Dispose the previous controller
      await previousCameraController.dispose();
    }

    /// Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
      enableAudio: false,
    );

    /// Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }

    /// Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    /// Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      eLogger('Error initializing camera: $e');
    }

    /// Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller.value.isInitialized;
      });
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// App state changed before we got the chance to initialize.
    if (!_isCameraInitialized) {
      return;
    }

    final CameraController cameraController = controller;

    if (state == AppLifecycleState.inactive) {
      /// Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      /// Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  void initState() {
    /// SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    _isRearCameraSelected = widget.isRearCameraSelected;

    onNewCameraSelected(widget.cameras[widget.isRearCameraSelected ? 1 : 0]);
    super.initState();
  }

  @override
  void dispose() {
    if (_isCameraInitialized) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isCameraInitialized) {
      return const Center();
    }

    return CameraPreview(
      controller,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 30,
              child: Center(
                child: GestureDetector(
                  onTap: () async {
                    XFile? rawImage = await takePicture();
                    if (rawImage != null) {
                      _cropImgAndGoBack(rawImage);
                    }
                    iLogger("onTap");
                  },
                  child: const Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.white38,
                        size: 80,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 40,
              bottom: 40,
              child: Center(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      _isCameraInitialized = false;
                      _isRearCameraSelected = !_isRearCameraSelected;
                    });
                    onNewCameraSelected(
                        widget.cameras[_isRearCameraSelected ? 1 : 0]);
                  },
                  child: const Icon(
                    Icons.flip_camera_android_rounded,
                    color: Colors.transparent,
                    size: 60,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    /*Scaffold(
      backgroundColor: Colors.black,
      body: _isCameraInitialized
          ? SingleChildScrollView(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: .6,
                    child: controller?.buildPreview(),
                  ),
                   */ /*const SizedBox(
                    height: 10,
                  ),*/ /*
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      PrimaryText("text -> ${controller?.value.aspectRatio}", fontColor: Colors.white,),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            XFile? rawImage = await takePicture();
                            if (rawImage != null) {
                              _cropImgAndGoBack(rawImage);
                            }
                            iLogger("onTap");
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: const [
                              Icon(
                                Icons.circle,
                                color: Colors.white38,
                                size: 80,
                              ),
                              Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 70,
                              ),
                            ],
                        ),
                      ),
                      Positioned(
                        right: 40,
                        child: Center(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _isCameraInitialized = false;
                                _isRearCameraSelected = !_isRearCameraSelected;
                              });
                              onNewCameraSelected(widget
                                  .cameras[_isRearCameraSelected ? 1 : 0]);
                            },
                            child: const PrimaryIcon(
                              Icons.flip_camera_android_rounded,
                              bgColor: Colors.transparent,
                              bgSize: 60,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : const Center(),
    )*/
  }

  Future<XFile?> takePicture() async {
    final CameraController cameraController = controller;

    if (!controller.value.isInitialized ||
        cameraController.value.isTakingPicture) {
      /// A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      eLogger('Error occurred while taking picture: $e');
      return null;
    }
  }

  _cropImgAndGoBack(XFile imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );

    dLogger("path -> ${croppedFile?.path}");

    Get.back(result: croppedFile?.path ?? "");
  }
}
