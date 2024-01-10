// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositResponse _$DepositResponseFromJson(Map<String, dynamic> json) =>
    DepositResponse(
      errorCode: json['errorCode'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$DepositResponseToJson(DepositResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errorMessage', instance.errorMessage);
  writeNotNull('errorCode', instance.errorCode);
  return val;
}
