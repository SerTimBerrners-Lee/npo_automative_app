import 'package:npo_automative_app/packages/product_repository/lib/src/model/product_model.dart';
import 'package:npo_automative_app/packages/shipments_repository/lib/src/model/shipments.model.dart';

import 'package:collection/collection.dart';

class ShipmentsMethods {
  String getProduct(List<dynamic> shipments) {
    final ShipmentsList sh = ShipmentsList.fromJson(shipments);
    final ships = sh.ships;
    final Shipments? finds = 
      ships.firstWhereOrNull((element) => element.product != null);
    
    if (finds != null) {
      final Product product = Product.fromJson(finds.product!);
      return '${product.fabricNumber}\n${product.name}'; 
    }
    return '-';
  }
}