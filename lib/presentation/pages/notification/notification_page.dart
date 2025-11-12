import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/domain/sse_notification/models/notification_model.dart';
import 'package:take_breath/domain/sse_notification/provider/notification_list_notifier.dart';
import 'package:take_breath/presentation/pages/index_stack_page/community/detail_page/community_detail_page.dart';
import 'widgets/notification_item_widge.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(notificationProvider.notifier).getNotificationList();
    });

    // 스크롤 끝에 도달하면 다음 페이지 로드
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(notificationProvider.notifier).loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationProvider);
    if (state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state.error != null) {
      return Center(
        child: Text('오류 발생: ${state.error}'),
      );
    }

    final notifications = state.data?.content ?? [];
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
                    onTap: () async {
                      await ref
                          .read(notificationProvider.notifier)
                          .markNotificationAsRead(notification.id);
                      switch (notification.notificationType) {
                        case NotificationType.POST_LIKE:
                        case NotificationType.COMMENT:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CommunityDetailPage(
                                  id: notification.relatedId),
                            ),
                          );
                          break;
                        case NotificationType.SYSTEM:
                          // 시스템 알림은 상세 화면 없으면 그냥 토스트 등
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("시스템 알림입니다.")),
                          );
                          break;
                      }
                    },
                    onDelete: () {});
              },
            ),
    );
  }
}
