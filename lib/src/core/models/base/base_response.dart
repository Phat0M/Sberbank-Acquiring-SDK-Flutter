import 'package:comparer/comparer.dart';

/// {@template base_response}
/// Базовый класс ответа Base API
/// {@endtemplate}
abstract class BaseResponse extends ComparerMap {
  /// {@macro base_response}
  BaseResponse();

  @override
  Map<String, Object?> get equals => <String, Object?>{};

  /// {@template toJson}
  /// Преобразование модели в json
  /// {@endtemplate}
  Map<String, dynamic> toJson();
}
