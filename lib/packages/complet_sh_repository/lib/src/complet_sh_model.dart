import 'package:json_annotation/json_annotation.dart';
import 'package:npo_automative_app/packages/shipments_repository/lib/src/model/shipments.model.dart';
part 'complet_sh_model.g.dart';

@JsonSerializable()
class ComplitSh {
  /// The generated code assumes these values exist in JSON.
  final int? id;
  final String? date_order, date_shipments, number_order, base, description;
  final bool? to_sklad;
  final List<dynamic> shipments;

  /// The generated code below handles if the corresponding JSON value doesn't
  /// exist or is empty.

  ComplitSh({
    required this.id,
    required this.date_order,
    required this.date_shipments,
    required this.number_order,
    required this.base,
    required this.to_sklad,
    required this.shipments,
    required this.description,
    });

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory ComplitSh.fromJson(Map<String, dynamic> json) => _$ComplitShFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  // Map<String, dynamic> toJson() => _$PersonToJson(this);
}

class ComplitShList {
  final List<ComplitSh> ships = [];
  ComplitShList.fromJson(List<dynamic> json) {
    for (var i = 0; i < json.length; i++) {
      ships.add(ComplitSh.fromJson(json[i]));
    }
  }
}