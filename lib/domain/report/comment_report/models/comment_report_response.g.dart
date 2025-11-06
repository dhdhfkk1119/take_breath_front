// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentReportResponseImpl _$$CommentReportResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentReportResponseImpl(
      reports: (json['reports'] as List<dynamic>)
          .map((e) => CommentReportListDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommentReportResponseImplToJson(
        _$CommentReportResponseImpl instance) =>
    <String, dynamic>{
      'reports': instance.reports,
    };

_$CommentReportCreateDTOImpl _$$CommentReportCreateDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentReportCreateDTOImpl(
      id: (json['id'] as num).toInt(),
      reporterId: (json['reporterId'] as num).toInt(),
      reporterName: json['reporterName'] as String,
      commentId: (json['commentId'] as num).toInt(),
      reason: json['reason'] as String,
      message: json['message'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$CommentReportCreateDTOImplToJson(
        _$CommentReportCreateDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reporterId': instance.reporterId,
      'reporterName': instance.reporterName,
      'commentId': instance.commentId,
      'reason': instance.reason,
      'message': instance.message,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };

_$CommentReportListDTOImpl _$$CommentReportListDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentReportListDTOImpl(
      id: (json['id'] as num).toInt(),
      reporterId: (json['reporterId'] as num).toInt(),
      reporterName: json['reporterName'] as String,
      commentId: (json['commentId'] as num).toInt(),
      commentContent: json['commentContent'] as String,
      reason: json['reason'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$CommentReportListDTOImplToJson(
        _$CommentReportListDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reporterId': instance.reporterId,
      'reporterName': instance.reporterName,
      'commentId': instance.commentId,
      'commentContent': instance.commentContent,
      'reason': instance.reason,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };

_$CommentReportDetailDTOImpl _$$CommentReportDetailDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentReportDetailDTOImpl(
      id: (json['id'] as num).toInt(),
      reporterId: (json['reporterId'] as num).toInt(),
      reporterName: json['reporterName'] as String,
      commentId: (json['commentId'] as num).toInt(),
      commentContent: json['commentContent'] as String,
      reason: json['reason'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      adminComments: (json['adminComments'] as List<dynamic>)
          .map((e) => AdminCommentDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommentReportDetailDTOImplToJson(
        _$CommentReportDetailDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reporterId': instance.reporterId,
      'reporterName': instance.reporterName,
      'commentId': instance.commentId,
      'commentContent': instance.commentContent,
      'reason': instance.reason,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'adminComments': instance.adminComments,
    };

_$AdminCommentDTOImpl _$$AdminCommentDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminCommentDTOImpl(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String,
      adminId: (json['adminId'] as num).toInt(),
      adminName: json['adminName'] as String,
      adminComment: json['adminComment'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$AdminCommentDTOImplToJson(
        _$AdminCommentDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'adminId': instance.adminId,
      'adminName': instance.adminName,
      'adminComment': instance.adminComment,
      'createdAt': instance.createdAt,
    };
