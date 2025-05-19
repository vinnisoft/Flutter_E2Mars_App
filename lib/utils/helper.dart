import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../export.dart';

class Helper{
  Helper._();

  static Future<File?> pickFile({String fileType="image"}) async {
    final FilePickerResult? result;

    if(fileType=="image"){
      result= await FilePicker.platform.pickFiles(
          type: FileType.image,
          allowMultiple: true
      );
    }
    else{
      result= await FilePicker.platform.pickFiles(
          type:FileType.custom,
          allowedExtensions: ['pdf'],
          allowMultiple: true
      );
    }



    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      debugPrint('Picked file: ${file.path}');
      return file;
    } else {
      return null;
    }
  }

  static Future<bool> checkStoragePermission() async {
    var status = await Permission.storage.status;

    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.storage.request();
      return result.isGranted;
    }
  }

  static Future<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      return true;
    } else {
      var result = await Permission.camera.request();
      return result.isGranted;
    }
  }

  //
  // static Future<void> takePhoto() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? photo = await picker.pickImage(source: ImageSource.camera);
  //
  //   if (photo != null) {
  //     File imageFile = File(photo.path);
  //     if (kDebugMode) {
  //       debugPrint('Photo taken: ${imageFile.path}');
  //     }
  //   } else {
  //     if (kDebugMode) {
  //       debugPrint('No photo taken');
  //     }
  //   }
  // }



  static Future<File?> takePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      final File imageFile = File(photo.path);
      if (kDebugMode) {
        debugPrint('Photo taken: ${imageFile.path}');
      }
      return imageFile;
    } else {
      if (kDebugMode) {
        debugPrint('No photo taken');
      }
      return null;
    }
  }






  static String addMinutesToTime(String timeString, int minutesToAdd) {
    try {
      final format = DateFormat("h:mm a");
      final parsedTime = format.parse(timeString);
      final newTime = parsedTime.add(Duration(minutes: minutesToAdd));

      return format.format(newTime);
    } catch (e) {
      debugPrint("Error parsing or adding time: $e");
      return timeString; // Return original string if error occurs
    }
  }





  static Future<bool> storagePermission() async {
    final DeviceInfoPlugin info = DeviceInfoPlugin(); // import 'package:device_info_plus/device_info_plus.dart';
    final AndroidDeviceInfo androidInfo = await info.androidInfo;
    debugPrint('releaseVersion : ${androidInfo.version.release}');
    final int androidVersion = int.parse(androidInfo.version.release);
    bool havePermission = false;

    // Here you can use android api level
    // like android api level 33 = android 13
    // This way you can also find out how to request storage permission

    if (androidVersion >= 13) {
      final request = await [
        Permission.videos,
        Permission.photos,
        //..... as needed
      ].request(); //import 'package:permission_handler/permission_handler.dart';

      havePermission = request.values.every((status) => status == PermissionStatus.granted);
    } else {
      final status = await Permission.storage.request();
      havePermission = status.isGranted;
    }

    if (!havePermission) {
      // if no permission then open app-setting
      await openAppSettings();
    }

    return havePermission;
  }

}