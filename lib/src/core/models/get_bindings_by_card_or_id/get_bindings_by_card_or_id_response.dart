import 'package:json_annotation/json_annotation.dart';
import 'package:sberbank_acquiring/src/core/models/common/binding.dart';

import '../../../constants.dart';
import '../base/acquiring_response.dart';

part 'get_bindings_by_card_or_id_response.g.dart';

/// {@template get_bindings_by_card_or_id_response}
/// Ответ списка связок определённой банковской карты
/// {@endtemplate}
@JsonSerializable(includeIfNull: false)
class GetBindingsByCardOrIdResponse extends AcquiringResponse {
  /// {@macro get_bindings_by_card_or_id_response}
  GetBindingsByCardOrIdResponse({
    this.errorCode,
    String? errorMessage,
    this.bindings,
  }) : super(
          errorMessage: errorMessage,
        );

  /// {@macro fromJson}
  factory GetBindingsByCardOrIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBindingsByCardOrIdResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetBindingsByCardOrIdResponseToJson(this);

  @override
  Map<String, Object?> get equals => <String, Object?>{
        ...super.equals,
        JsonKeys.bindings: bindings,
        JsonKeys.errorCode: errorCode,
      };

  @override
  bool get hasError => errorCode != null && errorCode != '0';

  /// Код ошибки
  ///
  /// Если ошибки не произошло, передается значение «0»
  @JsonKey(name: JsonKeys.errorCode)
  final String? errorCode;

  /// {@macro binding}
  @JsonKey(name: JsonKeys.bindings)
  final List<Binding>? bindings;
}
