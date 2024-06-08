class TrainerNotificationItem {
  final String icon;
  final String title;
  final String time;
  final String description;
  bool isUnread;

  TrainerNotificationItem(this.icon, this.title, this.time, this.description)
      : isUnread = true;
}
