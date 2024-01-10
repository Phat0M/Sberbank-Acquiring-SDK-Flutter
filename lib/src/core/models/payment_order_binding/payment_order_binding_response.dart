import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';

part 'payment_order_binding_response.g.dart';

/// {@template payment_order_binding_response}
/// Ответ проведения оплаты по связкам
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class PaymentOrderBindingResponse extends AcquiringResponse {
  /// {@macro payment_order_binding_response}
  PaymentOrderBindingResponse({
    required this.errorCode,
    this.redirect,
    this.info,
    this.acsUrl,
    this.paReq,
    this.termUrl,
  });

  /// {@macro fromJson}
  factory PaymentOrderBindingResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderBindingResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaymentOrderBindingResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.errorCode: errorCode,
        JsonKeys.redirect: redirect,
        JsonKeys.info: info,
        JsonKeys.acsUrl: acsUrl,
        JsonKeys.paReq: paReq,
        JsonKeys.termUrl: termUrl,
      };

  @override
  bool get hasError => errorCode != 0;

  ///Код ошибки. Может отсутствовать, если результат не привёл к ошибке.
  @JsonKey(name: JsonKeys.errorCode)
  final int errorCode;

  /// При успешном ответе. В случае платежа без необходимости аутентификации
  /// на ACS – URL, на который производится переадресация после платежа.
  /// В случае 3DS-платежа – URL для возврата с ACS.
  @JsonKey(name: JsonKeys.redirect)
  final String? redirect;

  /// При успешном ответе. Результат попытки оплаты. Возможные значения представлены ниже.
  /// - Ваш платёж обработан, происходит переадресация…
  /// - Операция отклонена. Проверьте введённые данные, достаточность средств на карте и повторите операцию. Происходит переадресация…
  /// - Извините, платёж не может быть совершён. Происходит переадресация…
  /// - Операция отклонена. Обратитесь в магазин. Происходит переадресация…
  /// - Операция отклонена. Обратитесь в банк, выпустивший карту. Происходит переадресация…
  /// - Операция невозможна. Аутентификация держателя карты завершена неуспешно. Происходит переадресация…
  /// - Нет связи с банком. Повторите позже. Происходит переадресация…
  /// - Истёк срок ожидания ввода данных. Происходит переадресация…
  /// - Не получен ответ от банка. Повторите позже. Происходит переадресация…
  @JsonKey(name: JsonKeys.info)
  final String? info;

  /// При успешном ответе в случае платежа с использованием 3-D Secure.
  /// URL-адрес для перехода на сервер контроля доступа.
  @JsonKey(name: JsonKeys.acsUrl)
  final String? acsUrl;

  /// При успешном ответе в случае платежа с использованием 3-D Secure.
  /// Payment Authentication Request - запрос на аутентификацию платежа.
  @JsonKey(name: JsonKeys.paReq)
  final String? paReq;

  /// При успешном ответе в случае платежа, в котором выполнялась проверка на принадлежность карты к 3-D Secure.
  /// URL-адрес для возврата с сервера контроля доступа.
  @JsonKey(name: JsonKeys.termUrl)
  final String? termUrl;
}
