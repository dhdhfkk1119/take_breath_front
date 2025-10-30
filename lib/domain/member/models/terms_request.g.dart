// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TermsRequestImpl _$$TermsRequestImplFromJson(Map<String, dynamic> json) =>
    _$TermsRequestImpl(
      termsId: (json['termsId'] as num).toInt(),
      agreed: json['agreed'] as bool?,
    );

Map<String, dynamic> _$$TermsRequestImplToJson(_$TermsRequestImpl instance) =>
    <String, dynamic>{
      'termsId': instance.termsId,
      'agreed': instance.agreed,
    };
