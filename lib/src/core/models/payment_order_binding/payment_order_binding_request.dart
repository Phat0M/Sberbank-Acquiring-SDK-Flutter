import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';

part 'payment_order_binding_request.g.dart';

/// {@template payment_order_binding_request}
/// Запрос проведения оплаты по связкам
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class PaymentOrderBindingRequest extends AcquiringRequest {
  /// {@macro payment_order_binding_request}
  PaymentOrderBindingRequest({
    required this.mdOrder,
    required this.bindingId,
    this.language,
    this.ip,
    this.cvc,
    this.email,
  });

  /// {@macro fromJson}
  factory PaymentOrderBindingRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderBindingRequestFromJson(json);

  /// Номер заказа в платёжном шлюзе. Уникален в пределах платёжного шлюза.
  @JsonKey(name: JsonKeys.mdOrder)
  final String mdOrder;

  /// Идентификатор созданной ранее связки. Может использоваться, только если у
  /// продавца есть разрешение на работу со связками. Если этот параметр
  /// передаётся в данном запросе, то это означает:
  /// 1. Данный заказ может быть оплачен только с помощью связки;
  /// 2. Плательщик будет перенаправлен на платёжную страницу, где требуется
  /// только ввод CVC.
  @JsonKey(name: JsonKeys.bindingId)
  final String bindingId;

  /// Язык в кодировке ISO 639-1. Если не указан, будет использован язык,
  /// указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String? language;

  /// IP-адрес покупателя. IPv6 поддерживается во всех запросах (до 39 символов).
  @JsonKey(name: JsonKeys.ip)
  final String? ip;

  /// Код CVC/CVV2 на обратной стороне карты.
  @JsonKey(name: JsonKeys.cvc)
  final int? cvc;

  /// Адрес электронной почты покупателя.
  @JsonKey(name: JsonKeys.email)
  final String? email;

  @override
  String get apiMethod => ApiMethods.paymentOrderBinding;

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.mdOrder: mdOrder,
        JsonKeys.bindingId: bindingId,
        JsonKeys.language: language,
        JsonKeys.ip: ip,
        JsonKeys.cvc: cvc,
        JsonKeys.email: email,
      };

  @override
  Map<String, dynamic> toJson() => _$PaymentOrderBindingRequestToJson(this);

  @override
  void validate() {}

  @override
  PaymentOrderBindingRequest copyWith({
    String? mdOrder,
    String? bindingId,
    String? language,
    String? ip,
    int? cvc,
    String? email,
  }) {
    return PaymentOrderBindingRequest(
      mdOrder: mdOrder ?? this.mdOrder,
      bindingId: bindingId ?? this.bindingId,
      language: language ?? this.language,
      ip: ip ?? this.ip,
      cvc: cvc ?? this.cvc,
      email: email ?? this.email,
    );
  }
}
