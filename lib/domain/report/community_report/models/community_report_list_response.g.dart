// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_report_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityReportListResponseImpl _$$CommunityReportListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityReportListResponseImpl(
      id: (json['id'] as num).toInt(),
      reporterId: (json['reporterId'] as num).toInt(),
      reporterName: json['reporterName'] as String,
      postId: (json['postId'] as num).toInt(),
      postTitle: json['postTitle'] as String,
      reason: json['reason'] as String,
      status:
          $enumDecodeNullable(_$CommunityReportStatusEnumMap, json['status']) ??
              CommunityReportStatus.PENDING,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$CommunityReportListResponseImplToJson(
        _$CommunityReportListResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reporterId': instance.reporterId,
      'reporterName': instance.reporterName,
      'postId': instance.postId,
      'postTitle': instance.postTitle,
      'reason': instance.reason,
      'status': _$CommunityReportStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt,
    };

const _$CommunityReportStatusEnumMap = {
  CommunityReportStatus.PENDING: 'PENDING',
  CommunityReportStatus.REJECTED: 'REJECTED',
  CommunityReportStatus.APPROVED: 'APPROVED',
};
