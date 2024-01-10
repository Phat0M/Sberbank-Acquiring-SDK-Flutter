import 'package:json_annotation/json_annotation.dart';
import 'package:sberbank_acquiring/src/constants.dart';

import '../base/acquiring_response.dart';

part 'bind_card_response.g.dart';

/// {@template bind_card_response}
/// Ответ активации связки
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class BindCardResponse extends AcquiringResponse {
  /// {@macro bind_card_response}
  BindCardResponse({
    this.errorCode,
    String? errorMessage,
  }) : super(
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory BindCardResponse.fromJson(Map<String, dynamic> json) =>
      _$BindCardResponseFromJson(json);

  @override
  bool get hasError => errorCode != null && errorCode != '0';

  /// Код ошибки
  ///
  /// Если ошибки не произошло, передается значение «0»
  @JsonKey(name: JsonKeys.errorCode)
  final String? errorCode;

  @override
  Map<String, dynamic> toJson() => _$BindCardResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
      };
}
