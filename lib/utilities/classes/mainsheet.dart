import 'package:scouts_flutter/utilities/driveutils.dart';

class MainSheet {
  List<String> emails = [];
  List<String> names = [];
  List<String> sclasses = [];
  List<String> patrols = [];
  List<bool> isPatrolLeaderList = [];
  List<String> progressURLList = [];
  List<String> eventURLList = [];
  List<String> uaURLList = [];
  var userRowId = -1;

  String get email => emails[userRowId];
  String get name => names[userRowId];
  String get sclass => sclasses[userRowId];
  String get patrol => patrols[userRowId];
  bool get isPatrolLeader => isPatrolLeaderList[userRowId];
  String get progressURL => progressURLList[userRowId];
  String get eventURL => eventURLList[userRowId];
  String get uaURL => uaURLList[userRowId];

  Future<void> initUserSheets(String email) async {
    final mainTable = DriveUtils.mainTable;
    emails = mainTable[0];
    names = mainTable[1];
    sclasses = mainTable[2];
    patrols = mainTable[3];
    isPatrolLeaderList =
        mainTable[4].map((e) => e == "TRUE" ? true : false).toList();
    progressURLList = mainTable[5];
    eventURLList = mainTable[6];
    uaURLList = mainTable[7];
    userRowId = emails.indexOf(email);
  }
}
