import 'package:json_annotation/json_annotation.dart';
import 'package:sberbank_acquiring/src/constants.dart';

import '../base/acquiring_response.dart';

part 'refund_response.g.dart';

/// {@template refund_response}
/// Ответ возврата на полную сумму в деньгах
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class RefundResponse extends AcquiringResponse {
  /// {@macro refund_response}
  RefundResponse({
    this.errorCode,
    String? errorMessage,
  }) : super(
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory RefundResponse.fromJson(Map<String, dynamic> json) =>
      _$RefundResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RefundResponseToJson(this);

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
