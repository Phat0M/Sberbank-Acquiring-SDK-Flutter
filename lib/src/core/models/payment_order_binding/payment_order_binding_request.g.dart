// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_order_binding_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOrderBindingRequest _$PaymentOrderBindingRequestFromJson(
        Map<String, dynamic> json) =>
    PaymentOrderBindingRequest(
      mdOrder: json['mdOrder'] as String,
      bindingId: json['bindingId'] as String,
      language: json['language'] as String?,
      ip: json['ip'] as String?,
      cvc: json['cvc'] as int?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$PaymentOrderBindingRequestToJson(
    PaymentOrderBindingRequest instance) {
  final val = <String, dynamic>{
    'mdOrder': instance.mdOrder,
    'bindingId': instance.bindingId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language);
  writeNotNull('ip', instance.ip);
  writeNotNull('cvc', instance.cvc);
  writeNotNull('email', instance.email);
  return val;
}
