import 'package:scouts_flutter/utilities/classes/requirements.dart';
import 'package:scouts_flutter/utilities/driveutils.dart';

class Progress {
  final String badgeName;
  final String badgeIcon;
  final String requirementsURL;
  final String requirementsCompletionURL;
  final bool badgeAcquired;
  final String dateCompletion;
  final List<Requirement> requirements;

  Progress._init(
      {required this.badgeName,
      required this.badgeIcon,
      required this.requirementsURL,
      required this.requirementsCompletionURL,
      required this.badgeAcquired,
      required this.dateCompletion,
      required this.requirements});

  static Future<Progress> init(
      {required String badgeName,
      required String badgeIcon,
      required String requirementsURL,
      required String requirementsCompletionURL,
      required bool badgeAcquired,
      required String dateCompletion}) async {
    final requirementsTable = await DriveUtils.getCSV(requirementsURL);
    final requirementsCompletedTable =
        await DriveUtils.getCSV(requirementsCompletionURL);
    final List<Requirement> requirements = [];

    if (requirementsCompletedTable.isNotEmpty) {
      final numRequirements = requirementsCompletedTable[0].length;
      for (var i = 0; i < numRequirements; i++) {
        requirements.add(Requirement(
            requirement: requirementsTable[0][i],
            completed: requirementsCompletedTable[0][i] == "TRUE",
            dateCompletion: requirementsCompletedTable[1][i]));
      }
    }

    return Progress._init(
        badgeName: badgeName,
        badgeIcon: badgeIcon,
        requirementsURL: requirementsURL,
        requirementsCompletionURL: requirementsCompletionURL,
        badgeAcquired: badgeAcquired,
        dateCompletion: dateCompletion,
        requirements: requirements);
  }
}
