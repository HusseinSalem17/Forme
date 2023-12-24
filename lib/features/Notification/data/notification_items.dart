class NotificationItem {
  final String icon;
  final String title;
  final String time;
  final String description;
  bool isUnread;

  NotificationItem(this.icon, this.title, this.time, this.description) : isUnread = true;
}