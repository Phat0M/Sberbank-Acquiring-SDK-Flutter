import 'package:json_annotation/json_annotation.dart';
import 'package:sberbank_acquiring/src/constants.dart';

import '../base/acquiring_response.dart';

part 'recurrent_payment_response.g.dart';

/// {@template recurrent_payment_response}
/// Ответ на проведение рекуррентных платежей Apple Pay
/// {@endtemplate}
sealed class RecurrentPaymentResponse extends AcquiringResponse {
  RecurrentPaymentResponse();

  /// {@macro fromJson}
  factory RecurrentPaymentResponse.fromJson(Map<String, dynamic> json) {
    final bool success = json[JsonKeys.success] as bool;

    if (success) {
      return SuccessRecurrentPaymentResponse.fromJson(
        json['data'] as Map<String, dynamic>,
      );
    } else {
      return FailureRecurrentPaymentResponse.fromJson(
        json['error'] as Map<String, dynamic>,
      );
    }
  }

  @override
  bool get hasError => this is FailureRecurrentPaymentResponse;

  @override
  String? get errorMessage => switch (this) {
        SuccessRecurrentPaymentResponse() => null,
        FailureRecurrentPaymentResponse(message: final String message) =>
          message,
      };
}

/// {@macro recurrent_payment_response}
@JsonSerializable(includeIfNull: false)
final class SuccessRecurrentPaymentResponse extends RecurrentPaymentResponse {
  /// {@macro recurrent_payment_response}
  SuccessRecurrentPaymentResponse({required this.orderId});

  /// {@macro fromJson}
  factory SuccessRecurrentPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessRecurrentPaymentResponseFromJson(json);

  /// Номер заказа в платежной системе.
  /// Уникален в пределах системы. Отсутствует если регистрация заказа на удалась
  /// по причине ошибки, детализированной в ErrorCode.
  @JsonKey(name: JsonKeys.orderId)
  final String orderId;

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.orderId: orderId,
      };

  @override
  Map<String, dynamic> toJson() =>
      _$SuccessRecurrentPaymentResponseToJson(this);
}

/// {@macro recurrent_payment_response}
@JsonSerializable(includeIfNull: false)

/// {@macro recurrent_payment_response}
final class FailureRecurrentPaymentResponse extends RecurrentPaymentResponse {
  /// {@macro recurrent_payment_response}
  FailureRecurrentPaymentResponse({
    required this.code,
    required this.describtion,
    required this.message,
  });

  /// {@macro fromJson}
  factory FailureRecurrentPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$FailureRecurrentPaymentResponseFromJson(json);

  /// Код ошибки
  @JsonKey(name: JsonKeys.code)
  final int code;

  /// Подробное техническое объяснение ошибки - содержимое этого параметра не
  /// предназначено для отображения пользователю.
  @JsonKey(name: JsonKeys.describtion)
  final String describtion;

  /// Понятное описание ошибки - предназначено для отображения пользователю.
  @JsonKey(name: JsonKeys.message)
  final String message;

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.code: code,
        JsonKeys.describtion: describtion,
        JsonKeys.message: message,
      };

  @override
  Map<String, dynamic> toJson() =>
      _$FailureRecurrentPaymentResponseToJson(this);
}
