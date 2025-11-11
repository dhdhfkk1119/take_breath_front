import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:take_breath/domain/chat/models/chat_message_response/chat_message_response.dart';

part 'chat_message_ui.freezed.dart';

@freezed
class ChatMessageUI with _$ChatMessageUI {
  const factory ChatMessageUI({
    required ChatMessageResponse message,
    required bool isMe,
    @Default(true) bool showProfile,
    @Default(true) bool showTimestamp,
  }) = _ChatMessageUI;

  const ChatMessageUI._();

  // ==================== 편의 Getter ====================

  /// 메시지 ID
  int get messageId => message.messageId;

  /// 발신자 ID
  int get senderId => message.senderId;

  /// 발신자 이름
  String get senderName => message.senderName;

  /// 메시지 내용
  String? get content => message.content;

  /// 생성 시간
  DateTime get createdAt => message.createdAt;

  /// 읽음 여부
  bool get isRead => message.isRead;

  /// 이미지 URL (있는 경우)
  String? get attachmentPath => message.attachmentPath;

  /// 현재 포인트 (포인트 메시지인 경우)
  int? get currentPoint => message.currentPoint;

  // ==================== 메시지 타입 체크 ====================

  /// 텍스트 메시지인지
  bool get isTextMessage => message.messageType == 'TEXT';

  /// 이미지 메시지인지
  bool get isImageMessage => message.messageType == 'IMAGE';

  /// 포인트 관련 메시지인지
  bool get isPointMessage =>
      message.messageType == 'POINT' || currentPoint != null;

  /// 시스템 메시지인지 (입장/퇴장 알림 등)
  bool get isSystemMessage => message.messageType == 'SYSTEM';

  // ==================== UI 헬퍼 메서드 ====================

  /// 포맷된 시간 문자열 반환
  /// - 오늘: "오후 3:24"
  /// - 어제: "어제"
  /// - 그 외: "1/15" -> 1원 15일 (수정)
  String get formattedTime {
    final now = DateTime.now();
    final messageDate = createdAt;
    final today = DateTime(now.year, now.month, now.day);
    final msgDay =
        DateTime(messageDate.year, messageDate.month, messageDate.day);

    final diff = today.difference(msgDay).inDays;

    if (diff == 0) {
      // 오늘: 시간만 표시
      final hour = messageDate.hour;
      final minute = messageDate.minute.toString().padLeft(2, '0');
      final period = hour < 12 ? '오전' : '오후';
      final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
      return '$period $displayHour:$minute';
    } else if (diff == 1) {
      // 어제
      return '어제';
    } else if (diff < 7) {
      // 일주일 이내: 요일
      const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
      return '${weekdays[messageDate.weekday - 1]}요일';
    } else {
      // 그 외: 날짜
      return '${messageDate.month}월 ${messageDate.day}일';
    }
  }

  /// 날짜 구분선에 표시할 텍스트
  /// 예: "2025년 1월 15일 수요일"
  String get dateDividerText {
    final date = createdAt;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final msgDay = DateTime(date.year, date.month, date.day);

    final diff = today.difference(msgDay).inDays;

    if (diff == 0) return '오늘';
    if (diff == 1) return '어제';

    const weekdays = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
    return '${date.year}년 ${date.month}월 ${date.day}일 ${weekdays[date.weekday - 1]}';
  }

  /// 메시지 버블의 정렬 방향
  /// - 내 메시지: CrossAxisAlignment.end
  /// - 타인 메시지: CrossAxisAlignment.start
  /*
  CrossAxisAlignment get bubbleAlignment {
    return isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
  }
  */

  /// 프로필 이미지 URL (타인 메시지만)
  String? get profileImageUrl {
    return isMe ? null : message.senderName; // 실제로는 Member에서 가져와야 함
  }

  // ==================== 비즈니스 로직 ====================

  /// 이전 메시지와 같은 발신자인지 체크
  bool isSameSenderAs(ChatMessageUI? other) {
    if (other == null) return false;
    return senderId == other.senderId;
  }

  /// 이전 메시지와 시간 차이 (분 단위)
  int minutesDifferenceFrom(ChatMessageUI? other) {
    if (other == null) return 999;
    return createdAt.difference(other.createdAt).inMinutes.abs();
  }

  /// 이전 메시지와 같은 날짜인지 체크
  bool isSameDateAs(ChatMessageUI? other) {
    if (other == null) return false;

    final thisDate = DateTime(createdAt.year, createdAt.month, createdAt.day);
    final otherDate = DateTime(
      other.createdAt.year,
      other.createdAt.month,
      other.createdAt.day,
    );

    return thisDate == otherDate;
  }

  /// 포인트 차감 메시지 텍스트
  /// 예: "포인트 100P 차감되었습니다"
/*
  String? get pointDeductionText {
    if (!isPointMessage || currentPoint == null) return null;
    return '포인트 ${currentPoint}P 차감되었습니다';
  }
  */
}
