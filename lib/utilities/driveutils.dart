import 'dart:convert';

import 'package:googleapis/drive/v3.dart' as drive;
import 'package:http/http.dart';
import 'package:scouts_flutter/authenticated_client.dart';
import 'package:scouts_flutter/main.dart';

class DriveUtils {
  static const utf8Decoder = Utf8Decoder(allowMalformed: true);
  static late final drive.DriveApi driveAPI;
  static late final List<List<String>> mainTable;
  static var _isInitialised = false;

  static Future<void> initializeDrive() async {
    if (_isInitialised) return;
    
    final authHeaders = await googleSignIn.currentUser!.authHeaders;
    final authenticateClient = AuthenticateClient(authHeaders, Client());
    driveAPI = drive.DriveApi(authenticateClient);
    mainTable = await getCSV("1v9ItNHslIZbQCRPdur5u30ITOvj-QXzrAXlZMjNEpLA");
    _isInitialised = true;
  }

  static Future<List<List<String>>> getCSV(String fileId) async {
    final drive.Media driveFile = (await driveAPI.files.export(
        fileId, "text/csv",
        downloadOptions: drive.DownloadOptions.fullMedia)) as drive.Media;
    final List<int> fileData = [];
    await driveFile.stream.listen((data) {
      fileData.addAll(data);
    }).asFuture();
    final csvString = utf8Decoder.convert(fileData);

    final List<List<String>> table = [];
    final rows = csvString.split('\n');
    final colLength = rows.length;
    for (var i = 0; i < colLength; i++) {
      final List<String> splitRow = rows[i].split(",");
      final rowLength = splitRow.length;
      for (var j = 0; j < rowLength; j++) {
        if (i == 0) {
          table.add([splitRow[j]]);
          continue;
        }
        table[j].add(splitRow[j]);
      }
    }

    return table;
  }
}
