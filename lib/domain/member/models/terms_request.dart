import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_request.freezed.dart';
part 'terms_request.g.dart';

@freezed
class TermsRequest with _$TermsRequest {
  const factory TermsRequest({
    required int termsId,
    bool? agreed,
  }) = _TermsRequest;

  factory TermsRequest.fromJson(Map<String, dynamic> json) =>
      _$TermsRequestFromJson(json);
}
