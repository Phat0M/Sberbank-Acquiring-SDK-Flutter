import 'package:json_annotation/json_annotation.dart';
import 'package:sberbank_acquiring/src/core/models/enums/enrolled.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';

part 'verify_enrollment_response.g.dart';

/// {@template verify_enrollment_response}
/// Ответ проверки вовлечённости карты в 3DS
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class VerifyEnrollmentResponse extends AcquiringResponse {
  /// {@macro verify_enrollment_response}
  VerifyEnrollmentResponse({
    this.errorCode,
    String? errorMessage,
    this.isEnrolled,
    this.emitterName,
    this.emitterCountryCode,
  }) : super(
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory VerifyEnrollmentResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyEnrollmentResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerifyEnrollmentResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.isEnrolled: isEnrolled,
        JsonKeys.emitterName: emitterName,
        JsonKeys.emitterCountryCode: emitterCountryCode,
        JsonKeys.errorCode: errorCode,
      };

  @override
  bool get hasError => errorCode != null && errorCode != '0';

  /// Код ошибки
  ///
  /// Если ошибки не произошло, передается значение «0»
  @JsonKey(name: JsonKeys.errorCode)
  final String? errorCode;

  /// {@macro enrolled}
  @JsonKey(name: JsonKeys.isEnrolled)
  final Enrolled? isEnrolled;

  /// Наименование банка-эмитента.
  @JsonKey(name: JsonKeys.emitterName)
  final String? emitterName;

  /// Код страны банка-эмитента.
  @JsonKey(name: JsonKeys.emitterCountryCode)
  final int? emitterCountryCode;
}
