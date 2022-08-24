import 'package:scouts_flutter/utilities/classes/person.dart';
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

  Future<void> initUserSheets() async {
    final mainTable = DriveUtils.mainTable;
    emails = mainTable[0];
    names = mainTable[1];
    sclasses = mainTable[2];
    patrols = mainTable[3];
    isPatrolLeaderList = mainTable[4].map((e) => e == "TRUE").toList();
    progressURLList = mainTable[5];
    eventURLList = mainTable[6];
    uaURLList = mainTable[7];
  }

  Future<Person> getPersonWithEmail(String userEmail) async {
    final userRowId = emails.indexOf(userEmail);
    final email = emails[userRowId];
    final name = names[userRowId];
    final sclass = sclasses[userRowId];
    final patrol = patrols[userRowId];
    final isPatrolLeader = isPatrolLeaderList[userRowId];
    final progressURL = progressURLList[userRowId];
    final eventURL = eventURLList[userRowId];
    final uaURL = uaURLList[userRowId];

    return Person.init(
        email: email,
        name: name,
        sclass: sclass,
        patrol: patrol,
        isPatrolLeader: isPatrolLeader,
        progressURL: progressURL,
        eventURL: eventURL,
        uaURL: uaURL);
  }
}
