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
    mainTable = await getCSV(
        "https://docs.google.com/spreadsheets/d/1v9ItNHslIZbQCRPdur5u30ITOvj-QXzrAXlZMjNEpLA/edit?usp=sharing");
    _isInitialised = true;
  }

  static Future<List<List<String>>> getCSV(String url) async {
    final uri = Uri.parse(url);
    final fileId = uri.pathSegments[2];
    final drive.Media driveFile = (await driveAPI.files.export(
        fileId, "text/csv",
        downloadOptions: drive.DownloadOptions.fullMedia)) as drive.Media;
    final List<int> fileData = [];
    await driveFile.stream.listen((data) {
      fileData.addAll(data);
    }).asFuture();
    final csvString = utf8Decoder.convert(fileData);
    final List<List<String>> table = [];
    final rows = csvString.split('\r\n');
    rows.removeAt(0);
    final numRows = rows.length;
    for (var i = 0; i < numRows; i++) {
      final List<String> splitRow = rows[i].split(",");
      final numColumns = splitRow.length;
      for (var j = 0; j < numColumns; j++) {
        if (i == 0) {
          table.add([splitRow[j].replaceAll("/;", ",")]);
          continue;
        }
        table[j].add(splitRow[j].replaceAll("/;", ","));
        //print("added ${splitRow[j].replaceAll("/;", ",")}");
      }
    }

    return table;
  }
}
