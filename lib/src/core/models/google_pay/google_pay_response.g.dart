// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_pay_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GooglePayResponse _$GooglePayResponseFromJson(Map<String, dynamic> json) =>
    GooglePayResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] == null
          ? null
          : ErrorInfo.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GooglePayResponseToJson(GooglePayResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('errorCode', instance.errorCode);
  writeNotNull('success', instance.success);
  writeNotNull('data', instance.data);
  writeNotNull('error', instance.error);
  return val;
}
