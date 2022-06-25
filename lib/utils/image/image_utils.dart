// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import 'package:learn_flutter/utils/utilities.dart';

class ImageUtils {
  ImageUtils();
  static final Dio dio = Dio();

  static Future<bool> saveImage(String url, String fileName) async {
    Directory directory;
    // Gives error msg, accessing local hidden methods
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    try {
      if (Platform.isAndroid) {
        if (await requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          newPath = "$newPath/$appName";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File("${directory.path}/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  static downloadFile(String url, context) async {
    String filename = Utilities.uuid2();
    bool downloaded = await saveImage(url, "$filename.jpeg");
    if (downloaded) {
      // ignore: use_build_context_synchronously
      Utilities.mSnackBar(context, "Image downloaded!");
      print("File Downloaded");
    } else {
      print("Problem Downloading File");
    }
  }

  static shareImage(String url) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String packageName = packageInfo.packageName;
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;

    final directory = await getTemporaryDirectory();
    final path = '${directory.path}/image_quote.jpeg';
    File(path).writeAsBytesSync(bytes);
    final text =
        "More: https://play.google.com/store/apps/details?id=${packageName}";
    await Share.shareFiles([path], text: text);
  }
}
