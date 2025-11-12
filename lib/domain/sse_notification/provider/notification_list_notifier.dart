import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:take_breath/_core/utils/base_state.dart';
import 'package:take_breath/_core/utils/page_request.dart';
import 'package:take_breath/domain/sse_notification/models/notification_model.dart';
import 'package:take_breath/domain/sse_notification/repositoryies/notification_repository.dart';

final notificationProvider = NotifierProvider<NotificationListNotifier,
    BaseState<PageResponse<NotificationModel>>>(
  () => NotificationListNotifier(),
);

class NotificationListNotifier
    extends Notifier<BaseState<PageResponse<NotificationModel>>> {
  final NotificationRepository notificationRepository =
      NotificationRepository();

  PageRequest _pageRequest = PageRequest(page: 0, size: 10);
  bool _hasMore = true;

  @override
  BaseState<PageResponse<NotificationModel>> build() {
    return BaseState<PageResponse<NotificationModel>>.initial();
  }

  Future<void> getNotificationList({int size = 10, int page = 0}) async {
    state = state.loading();
    try {
      _pageRequest = PageRequest(page: 0, size: size);
      final result = await notificationRepository.getNotificationList(
        page: _pageRequest.page,
        size: _pageRequest.size,
      );
      _hasMore = !result.isLast;
      state = state.success(result);
    } catch (e) {
      state = state.failure(e.toString());
    }
  }

  Future<void> loadNextPage() async {
    // 마지막 페이지면 중단
    if (!_hasMore) return;

    try {
      final currentState = state.data;
      if (currentState == null) return;

      _pageRequest = _pageRequest.next();

      final result = await notificationRepository.getNotificationList(
        page: _pageRequest.page,
        size: _pageRequest.size,
      );

      _hasMore = !result.isLast;

      // 기존 content + 새로운 content 병합
      final mergedContent = [
        ...currentState.content,
        ...result.content,
      ];

      final mergedPage = currentState.copyWith(
        content: mergedContent,
        pageNumber: result.pageNumber,
        isLast: result.isLast,
      );

      state = state.success(mergedPage);
    } catch (e) {
      state = state.failure(e.toString());
    }
  }

  Future<void> refresh() async {
    await getNotificationList(size: _pageRequest.size);
  }

  Future<void> markNotificationAsRead(int id) async {
    try {
      await notificationRepository.markNotificationAsRead(id);

      if (state.data != null) {
        final updatedList = state.data!.content.map((notification) {
          if (notification.id == id) {
            return notification.copyWith(read: true);
          }
          return notification;
        }).toList();

        state = state.success(
          state.data!.copyWith(content: updatedList),
        );
      }
    } catch (e) {
      state = state.failure("알람 읽음 처리중 오류 발생");
    }
  }
}
