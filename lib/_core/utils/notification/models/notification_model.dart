class NotificationItem {
  final int id;
  final String title;
  final String content;
  final String timeAgo;
  final String? profileImage;
  bool isRead;

  NotificationItem({
    required this.id,
    required this.title,
    required this.content,
    required this.timeAgo,
    this.profileImage,
    this.isRead = false,
  });
}
