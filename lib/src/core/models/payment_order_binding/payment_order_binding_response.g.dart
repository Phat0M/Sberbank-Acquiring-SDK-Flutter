// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_order_binding_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOrderBindingResponse _$PaymentOrderBindingResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentOrderBindingResponse(
      errorCode: json['errorCode'] as int,
      redirect: json['redirect'] as String?,
      info: json['info'] as String?,
      acsUrl: json['acsUrl'] as String?,
      paReq: json['paReq'] as String?,
      termUrl: json['termUrl'] as String?,
    );

Map<String, dynamic> _$PaymentOrderBindingResponseToJson(
    PaymentOrderBindingResponse instance) {
  final val = <String, dynamic>{
    'errorCode': instance.errorCode,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('redirect', instance.redirect);
  writeNotNull('info', instance.info);
  writeNotNull('acsUrl', instance.acsUrl);
  writeNotNull('paReq', instance.paReq);
  writeNotNull('termUrl', instance.termUrl);
  return val;
}
