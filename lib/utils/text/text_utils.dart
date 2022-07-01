import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:learn_flutter/utils/image/image_utils.dart';
import 'package:learn_flutter/utils/utilities.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class TextUtils {
  static final Dio dio = Dio();
  static String quoteSavedToMedia = "Image downloaded!";
  static String preparingToShareQuote = "Preparing to share Quote";

  static takeScreenShot(context, mykey, bool save) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    Directory directory;
    String fileName = Utilities.uuid2();

    try {
      if (Platform.isAndroid) {
        if (await ImageUtils.requestPermission(Permission.storage)) {
          RenderRepaintBoundary boundary =
              mykey.currentContext?.findRenderObject() as RenderRepaintBoundary;
          ui.Image image = await boundary.toImage();

          directory = (await getExternalStorageDirectory())!;
          ByteData? byteData =
              await image.toByteData(format: ui.ImageByteFormat.png);

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
          String mypath = "${directory.path}/$fileName.png";
          print(mypath);
          File saveFile = File(mypath);
          if (!await directory.exists()) {
            print("creating dir");
            await directory.create(recursive: true);
          }
          if (await directory.exists()) {
            if (byteData != null) {
              Uint8List pngBytes = byteData.buffer.asUint8List();
              saveFile.writeAsBytes(pngBytes);
              if (!save) {
                Utilities.mSnackBar(context, quoteSavedToMedia);
              }
            }
          }
          if (save) {
            Utilities.mSnackBar(context, preparingToShareQuote);
            await Future.delayed(Duration(seconds: 1));
            await Share.shareFiles([saveFile.path]);
          }
        }
      } else {
        if (await ImageUtils.requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }

      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
