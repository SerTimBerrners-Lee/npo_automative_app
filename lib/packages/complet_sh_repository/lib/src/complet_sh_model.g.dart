part of 'complet_sh_model.dart';

ComplitSh _$ComplitShFromJson(Map<String, dynamic> json) => ComplitSh(
      id: json['id'] as int,
      date_order: json['date_order'] as String?,
      date_shipments: json['date_shipments'] as String?,
      number_order: json['number_order'] as String?,
      base: json['base'] as String?,
      to_sklad: json['to_sklad'] as bool,
      shipments: json['shipments'] as List<dynamic>,
      description: json['description'] as String?
    );

// Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
//       'firstName': instance.firstName,
//       'lastName': instance.lastName,
//       'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
//     };