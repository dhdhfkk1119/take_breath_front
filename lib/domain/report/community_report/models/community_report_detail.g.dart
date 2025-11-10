// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_report_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommunityReportDetailImpl _$$CommunityReportDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$CommunityReportDetailImpl(
      id: (json['id'] as num).toInt(),
      reporterId: (json['reporterId'] as num).toInt(),
      reporterName: json['reporterName'] as String,
      postId: (json['postId'] as num).toInt(),
      postTitle: json['postTitle'] as String,
      postContent: json['postContent'] as String,
      reason: json['reason'] as String,
      status:
          $enumDecodeNullable(_$CommunityReportStatusEnumMap, json['status']) ??
              CommunityReportStatus.PENDING,
      createdAt: json['createdAt'] as String,
      adminComments: (json['adminComments'] as List<dynamic>?)
              ?.map((e) => AdminComment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CommunityReportDetailImplToJson(
        _$CommunityReportDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reporterId': instance.reporterId,
      'reporterName': instance.reporterName,
      'postId': instance.postId,
      'postTitle': instance.postTitle,
      'postContent': instance.postContent,
      'reason': instance.reason,
      'status': _$CommunityReportStatusEnumMap[instance.status]!,
      'createdAt': instance.createdAt,
      'adminComments': instance.adminComments,
    };

const _$CommunityReportStatusEnumMap = {
  CommunityReportStatus.PENDING: 'PENDING',
  CommunityReportStatus.REJECTED: 'REJECTED',
  CommunityReportStatus.APPROVED: 'APPROVED',
};
