

import 'package:npo_automative_app/packages/product_repository/lib/src/model/product_model.dart';

class Shipments {
  final int id;
  final Map<String, dynamic>? product;

  Shipments({
    required this.id, 
    required this.product
  });

  Shipments.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    product = json['product'] == null ? null : json['product']; 
}

class ShipmentsList {
  final List<Shipments> ships = [];
  ShipmentsList.fromJson(List<dynamic> json) {
    for (var i = 0; i < json.length; i++) {
      ships.add(Shipments.fromJson(json[i]));
    }
  }
}