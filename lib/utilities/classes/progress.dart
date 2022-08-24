class Progress {
  final String badgeName;
  final String badgeIcon;
  final String requirementsURL;
  final String requirementsCompletionURL;
  final bool badgeAcquired;
  final String dateCompletion;

  Progress(
      {required this.badgeName,
      required this.badgeIcon,
      required this.requirementsURL,
      required this.requirementsCompletionURL,
      required this.badgeAcquired,
      required this.dateCompletion});
}
