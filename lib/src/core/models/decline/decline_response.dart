import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';

part 'decline_response.g.dart';

/// {@template decline_response}
/// Ответ отмены неоплаченного заказа
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class DeclineResponse extends AcquiringResponse {
  /// {@macro decline_response}
  DeclineResponse({
    this.errorCode,
    String? errorMessage,
    this.userMessage,
  }) : super(
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory DeclineResponse.fromJson(Map<String, dynamic> json) =>
      _$DeclineResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeclineResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.userMessage: userMessage,
        JsonKeys.errorCode: errorCode,
      };

  @override
  bool get hasError => errorCode != null && errorCode != '0';

  /// Код ошибки
  ///
  /// Если ошибки не произошло, передается значение «0»
  @JsonKey(name: JsonKeys.errorCode)
  final String? errorCode;

  /// Сообщению пользователю с описанием кода результата.
  @JsonKey(name: JsonKeys.userMessage)
  final String? userMessage;
}
