// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurrent_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessRecurrentPaymentResponse _$SuccessRecurrentPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    SuccessRecurrentPaymentResponse(
      orderId: json['orderId'] as String,
    );

Map<String, dynamic> _$SuccessRecurrentPaymentResponseToJson(
        SuccessRecurrentPaymentResponse instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
    };

FailureRecurrentPaymentResponse _$FailureRecurrentPaymentResponseFromJson(
        Map<String, dynamic> json) =>
    FailureRecurrentPaymentResponse(
      code: json['code'] as int,
      describtion: json['describtion'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$FailureRecurrentPaymentResponseToJson(
        FailureRecurrentPaymentResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'describtion': instance.describtion,
      'message': instance.message,
    };
