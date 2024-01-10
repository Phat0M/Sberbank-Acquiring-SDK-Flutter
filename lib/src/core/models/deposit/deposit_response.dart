import 'package:json_annotation/json_annotation.dart';
import 'package:sberbank_acquiring/src/constants.dart';

import '../base/acquiring_response.dart';

part 'deposit_response.g.dart';

/// {@template deposit_response}
/// Ответ завершения на полную сумму в деньгах
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class DepositResponse extends AcquiringResponse {
  /// {@macro deposit_response}
  DepositResponse({
    this.errorCode,
    String? errorMessage,
  }) : super(
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory DepositResponse.fromJson(Map<String, dynamic> json) =>
      _$DepositResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DepositResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.errorCode: errorCode,
      };

  @override
  bool get hasError => errorCode != null && errorCode != '0';

  /// Код ошибки
  ///
  /// Если ошибки не произошло, передается значение «0»
  @JsonKey(name: JsonKeys.errorCode)
  final String? errorCode;
}
