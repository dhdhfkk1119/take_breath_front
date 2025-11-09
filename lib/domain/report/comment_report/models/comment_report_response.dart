import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_report_response.freezed.dart';
part 'comment_report_response.g.dart';

@freezed
class CommentReportResponse with _$CommentReportResponse {
  const factory CommentReportResponse({
    required List<CommentReportListDTO> reports,
  }) = _CommentReportResponse;

  factory CommentReportResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentReportResponseFromJson(json);
}

@freezed
class CommentReportCreateDTO with _$CommentReportCreateDTO {
  const factory CommentReportCreateDTO({
    required int id,
    required int reporterId,
    required String reporterName,
    required int commentId,
    required String reason,
    required String message,
    required String status, // enum 대신 문자열로 받음
    required String createdAt,
  }) = _CommentReportCreateDTO;

  factory CommentReportCreateDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentReportCreateDTOFromJson(json);
}

@freezed
class CommentReportListDTO with _$CommentReportListDTO {
  const factory CommentReportListDTO({
    required int id,
    required int reporterId,
    required String reporterName,
    required int commentId,
    required String commentContent,
    required String reason,
    required String status,
    required String createdAt,
  }) = _CommentReportListDTO;

  factory CommentReportListDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentReportListDTOFromJson(json);
}

@freezed
class CommentReportDetailDTO with _$CommentReportDetailDTO {
  const factory CommentReportDetailDTO({
    required int id,
    required int reporterId,
    required String reporterName,
    required int commentId,
    required String commentContent,
    required String reason,
    required String status,
    required String createdAt,
    required List<AdminCommentDTO> adminComments,
  }) = _CommentReportDetailDTO;

  factory CommentReportDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentReportDetailDTOFromJson(json);
}

@freezed
class AdminCommentDTO with _$AdminCommentDTO {
  const factory AdminCommentDTO({
    required int id,
    required String status,
    required int adminId,
    required String adminName,
    required String adminComment,
    required String createdAt,
  }) = _AdminCommentDTO;

  factory AdminCommentDTO.fromJson(Map<String, dynamic> json) =>
      _$AdminCommentDTOFromJson(json);
}
