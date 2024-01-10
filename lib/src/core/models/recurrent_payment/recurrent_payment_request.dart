import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_request.dart';
import '../common/billing_payer_data.dart';

part 'recurrent_payment_request.g.dart';

/// {@template recurrent_payment_request}
/// Запрос на проведение рекуррентных платежей Apple Pay
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class RecurrentPaymentRequest extends AcquiringRequest {
  /// {@macro recurrent_payment_request}
  RecurrentPaymentRequest({
    required this.orderNumber,
    required this.bindingId,
    required this.amount,
    this.language,
    this.currency,
    this.description,
    this.additionalParameters,
    this.billingPayerData,
  });

  /// {@macro fromJson}
  factory RecurrentPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$RecurrentPaymentRequestFromJson(json);

  /// Номер заказа в системе магазина.
  @JsonKey(name: JsonKeys.orderNumber)
  final String orderNumber;

  /// Язык в кодировке ISO 639-1.
  /// Если не указан, будет использован язык, указанный в настройках магазина как язык по умолчанию.
  @JsonKey(name: JsonKeys.language)
  final String? language;

  /// Идентификатор связки, созданной ранее.
  @JsonKey(name: JsonKeys.bindingId)
  final String bindingId;

  /// Сумма платежа в минимальных единицах валюты.
  @JsonKey(name: JsonKeys.amount)
  final int amount;

  /// Код валюты платежа ISO 4217.
  /// Если не указано, то используется значение по умолчанию.
  @JsonKey(name: JsonKeys.currency)
  final int? currency;

  /// Описание заказа в свободной форме. В процессинг банка для включения в финансовую
  /// отчётность продавца передаются только первые 24 символа этого поля.
  @JsonKey(name: JsonKeys.description)
  final String? description;

  /// Дополнительные параметры заказа, которые сохраняются для просмотра из личного кабинета продавца.
  ///
  /// Каждую новую пару имени и значения параметра следует отделять запятой.
  ///
  /// Пример:
  /// ```json
  /// {
  ///     "firstParamName": "firstParamValue",
  ///     "secondParamName": "secondParamValue"
  /// }
  /// ```
  ///
  /// В параметре запрещено передавать зарезервированные имена (в случае их передачи заказ может быть отклонен):
  /// - sbrf_spasibo:amount_bonus
  /// - sbrf_sbermiles:amount_bonus
  /// - loyaltyId
  @JsonKey(name: JsonKeys.additionalParameters)
  final Map<String, dynamic>? additionalParameters;

  /// {@macro billing_payer_data}
  @JsonKey(name: JsonKeys.billingPayerData)
  final BillingPayerData? billingPayerData;

  @override
  String get apiMethod => ApiMethods.recurrentPayment;

  @override
  Map<String, String> get headers => <String, String>{
        NetworkSettings.contentType: NetworkSettings.contentTypeJson,
      };

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.orderNumber: orderNumber,
        JsonKeys.language: language,
        JsonKeys.bindingId: bindingId,
        JsonKeys.amount: amount,
        JsonKeys.currency: currency,
        JsonKeys.description: description,
        JsonKeys.additionalParameters: additionalParameters,
        JsonKeys.billingPayerData: billingPayerData,
      };

  @override
  Map<String, dynamic> toJson() => _$RecurrentPaymentRequestToJson(this);

  @override
  RecurrentPaymentRequest copyWith({
    String? orderNumber,
    String? language,
    String? bindingId,
    int? amount,
    int? currency,
    String? description,
    Map<String, dynamic>? additionalParameters,
    BillingPayerData? billingPayerData,
  }) {
    return RecurrentPaymentRequest(
      orderNumber: orderNumber ?? this.orderNumber,
      language: language ?? this.language,
      bindingId: bindingId ?? this.bindingId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      additionalParameters: additionalParameters ?? this.additionalParameters,
      billingPayerData: billingPayerData ?? this.billingPayerData,
    );
  }

  @override
  void validate() {}
}
