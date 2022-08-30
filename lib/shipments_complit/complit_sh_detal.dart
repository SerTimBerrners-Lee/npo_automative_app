

import 'package:flutter/material.dart';
import 'package:npo_automative_app/library/methods.dart';
import 'package:npo_automative_app/packages/complet_sh_repository/lib/src/complet_sh_model.dart';

class ComplitShDetals extends StatelessWidget {
  final ComplitSh shComplit;

  ComplitShDetals(this.shComplit);
  ShipmentsMethods sm = ShipmentsMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Детальная информация'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: _buildContent(),
      ),
    );
  }
  
  Widget _buildContent() {
    print(shComplit.base);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            // leading: Image.network(shComplit.base!),
            title: Text('${shComplit.number_order}'),
            subtitle: Text('\n${sm.getProduct(shComplit.shipments)}\n${shComplit.date_shipments}'),
          ),
          Padding(padding: EdgeInsets.all(10)),
          ListTile(
            // leading: Image.network(shComplit.base!),
            title: Text('Остальная информация'),
            subtitle: Text('''
              \nДата заказа: ${shComplit.date_order}
              \nНа склад: ${shComplit.to_sklad == true ? 'Да': 'Нет'}
              \n${shComplit.description != '' ? 'Описание: ${shComplit.description}' : ''}
              '''),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  } 
}