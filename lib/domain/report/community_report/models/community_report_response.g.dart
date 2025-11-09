// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityReportResponseImpl _$$CommunityReportResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityReportResponseImpl(
      id: (json['id'] as num).toInt(),
      reporterId: (json['reporterId'] as num).toInt(),
      reporterName: json['reporterName'] as String,
      postId: (json['postId'] as num).toInt(),
      reason: json['reason'] as String,
      message: json['message'] as String,
      status:
          $enumDecodeNullable(_$CommunityReportStatusEnumMap, json['status']) ??
              CommunityReportStatus.PENDING,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$CommunityReportResponseImplToJson(
        _$CommunityReportResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reporterId': instance.reporterId,
      'reporterName': instance.reporterName,
      'postId': instance.postId,
      'reason': instance.reason,
      'message': instance.message,
      'status': _$CommunityReportStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt,
    };

const _$CommunityReportStatusEnumMap = {
  CommunityReportStatus.PENDING: 'PENDING',
  CommunityReportStatus.REJECTED: 'REJECTED',
  CommunityReportStatus.APPROVED: 'APPROVED',
};
