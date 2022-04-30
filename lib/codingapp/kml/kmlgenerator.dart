import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:downloads_path_provider/downloads_path_provider.dart';

class KMLGenerator {
  static generateKML(data, filename) async {
    try {
      final downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
      var savePath = downloadsDirectory.path;
      final file = File("$savePath/$filename.kml");
      await file.writeAsString(data);
      return Future.value(file);
    } catch (e) {
      print(e);
      return Future.error(e);
    }
  }
}
