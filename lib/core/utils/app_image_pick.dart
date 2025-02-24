import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// in info plist:
///<string>NSPhotoLibraryUsageDescription </string>
///<key>Allow photos access to set your profile picture.</key>
///<string>NSCameraUsageDescription </string>
///<key>Allow camera access to capture your profile picture.</key>
/// in build.gradle in app:
/// minSdk = 21

class AppImagePick {
  static Future<XFile?> pickImage(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return XFile(image.path);
      }
      return null;
    } catch (e) {
      final permissionStatus = await Permission.photos.status;
      if (permissionStatus.isDenied) {
        // show dialog IOS
        await _showAlertPermissionsDialog(context);
      } else {
        log(e.toString());
      }
    }
  }

  // show dialog IOS
  static Future<void> _showAlertPermissionsDialog(BuildContext context) async {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Permissions Denied'),
          content: const Text('Allow access to gallery and photos.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: const Text('Settings'),
              onPressed: () => openAppSettings(),
            ),
          ],
        );
      },
    );
  }
}

Future<MultipartFile> uploadImageToAPI(XFile image) async {
  return MultipartFile.fromFile(image.path,
      filename: image.path.split('/').last);
}
