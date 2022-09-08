import 'package:scouts_flutter/utilities/classes/progress.dart';
import 'package:scouts_flutter/utilities/driveutils.dart';

class Person {
  final String email;
  final String name;
  final String sclass;
  final String patrol;
  final bool isPatrolLeader;
  final String progressURL;
  final String eventURL;
  final String uaURL;
  List<Progress> progress = [];

  Person._init(
      {required this.email,
      required this.name,
      required this.sclass,
      required this.patrol,
      required this.isPatrolLeader,
      required this.progressURL,
      required this.eventURL,
      required this.uaURL,
      required this.progress});

  static Future<Person> init(
      {required String email,
      required String name,
      required String sclass,
      required String patrol,
      required bool isPatrolLeader,
      required String progressURL,
      required String eventURL,
      required String uaURL}) async {
    final progressTable = await DriveUtils.getCSV(progressURL);
    final List<Progress> progress = [];
    final badgeNames = progressTable[0];
    final badgeIcons = progressTable[1];
    final requirementURLs = progressTable[2];
    final requirementsCompletionURLs = progressTable[3];
    final badgeAcquiredList = progressTable[4];
    final dateCompletionList = progressTable[5];
    for (var i = 0; i < badgeNames.length; i++) {
      progress.add(await Progress.init(
          badgeName: badgeNames[i],
          badgeIcon: badgeIcons[i],
          requirementsURL: requirementURLs[i],
          requirementsCompletionURL: requirementsCompletionURLs[i],
          badgeAcquired: badgeAcquiredList[i] == "TRUE",
          dateCompletion: dateCompletionList[i]));
    }
    return Person._init(
        email: email,
        name: name,
        sclass: sclass,
        patrol: patrol,
        isPatrolLeader: isPatrolLeader,
        progressURL: progressURL,
        eventURL: eventURL,
        uaURL: uaURL,
        progress: progress);
  }
}
