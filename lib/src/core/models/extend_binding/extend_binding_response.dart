import 'package:json_annotation/json_annotation.dart';
import 'package:sberbank_acquiring/src/constants.dart';

import '../base/acquiring_response.dart';

part 'extend_binding_response.g.dart';

/// {@template extend_binding_response}
/// Ответ изменения срока действия связки
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class ExtendBindingResponse extends AcquiringResponse {
  /// {@macro extend_binding_response}
  ExtendBindingResponse({
    this.errorCode,
    String? errorMessage,
  }) : super(
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory ExtendBindingResponse.fromJson(Map<String, dynamic> json) =>
      _$ExtendBindingResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ExtendBindingResponseToJson(this);

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
