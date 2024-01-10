import 'package:json_annotation/json_annotation.dart';

import '../../../constants.dart';
import 'base_response.dart';

/// {@template acquiring_response}
/// Базовый класс ответа Base API
/// {@endtemplate}
abstract class AcquiringResponse extends BaseResponse {
  /// {@macro acquiring_response}
  AcquiringResponse({
    this.errorMessage,
  });

  @override
  Map<String, Object?> get equals => <String, Object?>{
        JsonKeys.errorMessage: errorMessage,
      };

  /// Проверка наличии ошибки
  bool get hasError;

  /// Краткое описание ошибки
  @JsonKey(name: JsonKeys.errorMessage)
  final String? errorMessage;
}
