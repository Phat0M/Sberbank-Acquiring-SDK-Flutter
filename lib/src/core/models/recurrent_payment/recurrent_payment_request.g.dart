// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurrent_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecurrentPaymentRequest _$RecurrentPaymentRequestFromJson(
        Map<String, dynamic> json) =>
    RecurrentPaymentRequest(
      orderNumber: json['orderNumber'] as String,
      bindingId: json['bindingId'] as String,
      amount: json['amount'] as int,
      language: json['language'] as String?,
      currency: json['currency'] as int?,
      description: json['description'] as String?,
      additionalParameters:
          json['additionalParameters'] as Map<String, dynamic>?,
      billingPayerData: json['billingPayerData'] == null
          ? null
          : BillingPayerData.fromJson(
              json['billingPayerData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecurrentPaymentRequestToJson(
    RecurrentPaymentRequest instance) {
  final val = <String, dynamic>{
    'orderNumber': instance.orderNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('language', instance.language);
  val['bindingId'] = instance.bindingId;
  val['amount'] = instance.amount;
  writeNotNull('currency', instance.currency);
  writeNotNull('description', instance.description);
  writeNotNull('additionalParameters', instance.additionalParameters);
  writeNotNull('billingPayerData', instance.billingPayerData);
  return val;
}
