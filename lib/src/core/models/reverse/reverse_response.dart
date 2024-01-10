import 'package:json_annotation/json_annotation.dart';
import 'package:sberbank_acquiring/src/constants.dart';

import '../base/acquiring_response.dart';

part 'reverse_response.g.dart';

/// {@template reverse_response}
/// Ответ отмены оплаты заказа.
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ReverseResponse extends AcquiringResponse {
  /// {@macro reverse_response}
  ReverseResponse({
    this.errorCode,
    String? errorMessage,
  }) : super(
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory ReverseResponse.fromJson(Map<String, dynamic> json) =>
      _$ReverseResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReverseResponseToJson(this);

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
