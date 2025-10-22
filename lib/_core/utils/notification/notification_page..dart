import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:take_breath/_core/utils/notification/widgets/notification_item_widge.dart';
import 'models/notification_model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late List<NotificationItem> notifications;

  @override
  void initState() {
    super.initState();
    notifications = [
      NotificationItem(
        id: 1,
        title: "직장 괴롭힘 기록",
        content: "오늘 작성하신 기록이 저장되었습니다. 힘들었던 하루를 기록으로 남기셨네요.",
        timeAgo: "14초 전",
        isRead: false,
      ),
      NotificationItem(
        id: 2,
        title: "커뮤니티 댓글 알림",
        content: "당신의 게시글에 '익명 사용자'님이 댓글을 남겼습니다. 응원의 메시지입니다.",
        timeAgo: "4일 전",
        isRead: false,
      ),
      NotificationItem(
        id: 3,
        title: "공감 알림",
        content: "'함께하는 마음'님이 당신의 게시글에 공감했습니다.",
        timeAgo: "1주 전",
        isRead: true,
      ),
      NotificationItem(
        id: 4,
        title: "팔로우 알림",
        content: "'희망 찾기'님이 당신을 팔로우하기 시작했습니다.",
        timeAgo: "1주 전",
        isRead: true,
      ),
      NotificationItem(
        id: 5,
        title: "시스템 알림",
        content: "Take Breath를 이용해주셔서 감사합니다. 건강한 직장 문화를 함께 만들어가요.",
        timeAgo: "2주 전",
        isRead: true,
      ),
    ];
  }

  void _deleteNotification(int id) {
    setState(() {
      notifications.removeWhere((notification) => notification.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('알림이 삭제되었습니다')),
    );
  }

  void _markAsRead(int id) {
    setState(() {
      final index =
          notifications.indexWhere((notification) => notification.id == id);
      if (index != -1) {
        notifications[index].isRead = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('알림'),
        centerTitle: true,
        elevation: 0,
      ),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.bell,
                    size: 64,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '알림이 없습니다',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationItemWidget(
                  notification: notification,
                  onTap: () => _markAsRead(notification.id),
                  onDelete: () => _deleteNotification(notification.id),
                );
              },
            ),
    );
  }
}
