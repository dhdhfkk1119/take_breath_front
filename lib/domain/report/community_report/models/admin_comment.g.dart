// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminCommentImpl _$$AdminCommentImplFromJson(Map<String, dynamic> json) =>
    _$AdminCommentImpl(
      id: (json['id'] as num).toInt(),
      status: $enumDecode(_$CommunityReportStatusEnumMap, json['status']),
      adminId: (json['adminId'] as num).toInt(),
      adminName: json['adminName'] as String,
      adminComment: json['adminComment'] as String,
      createdAd: json['createdAd'] as String,
    );

Map<String, dynamic> _$$AdminCommentImplToJson(_$AdminCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$CommunityReportStatusEnumMap[instance.status]!,
      'adminId': instance.adminId,
      'adminName': instance.adminName,
      'adminComment': instance.adminComment,
      'createdAd': instance.createdAd,
    };

const _$CommunityReportStatusEnumMap = {
  CommunityReportStatus.PENDING: 'PENDING',
  CommunityReportStatus.REJECTED: 'REJECTED',
  CommunityReportStatus.APPROVED: 'APPROVED',
};
