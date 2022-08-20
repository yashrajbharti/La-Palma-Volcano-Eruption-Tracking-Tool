import 'dart:io';

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';

class KMLGenerator {
  static generateKML(data, filename) async {
    try {
      final downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
      // Directory dir = Directory('/storage/emulated/0/Download');
      var savePath = downloadsDirectory?.path;
      final file = File("$savePath/$filename.kml");
      await file.writeAsString(data);
      return Future.value(file);
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
