import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

enum NotificationType { COMMENT, POST_LIKE, SYSTEM }

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required int id,
    required String content,
    required String senderName,
    required String receiverName,
    required NotificationType notificationType,
    required int relatedId,
    @Default(false) bool read,
    String? profileImageUrl,
    required String createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
