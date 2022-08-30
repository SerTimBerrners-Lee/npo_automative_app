import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npo_automative_app/library/methods.dart';
import 'package:npo_automative_app/packages/complet_sh_repository/lib/complet_sh_repository.dart';
import 'package:npo_automative_app/packages/complet_sh_repository/lib/src/complet_sh_model.dart';
import 'package:npo_automative_app/packages/product_repository/lib/src/model/product_model.dart';
import 'package:npo_automative_app/packages/shipments_repository/lib/src/model/shipments.model.dart';
import 'package:npo_automative_app/shipments_complit/bloc/complit_bloc.dart';
import 'package:npo_automative_app/shipments_complit/bloc/complit_event.dart';
import 'package:npo_automative_app/shipments_complit/bloc/complit_state.dart';
import 'package:npo_automative_app/shipments_complit/complit_sh_detal.dart';

class ShipmentsComplitPage extends StatefulWidget  {
  @override 
  _ShipmentsComplitState createState() => _ShipmentsComplitState();
}

class _ShipmentsComplitState extends State<ShipmentsComplitPage> {

  ComplectShRepository complectRepository = ComplectShRepository();
  final ShipmentsMethods sm = ShipmentsMethods();

  @override 
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text("Отгруженные заказы"),
        shadowColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) {
          return ComplitShBloc(complectRepository: complectRepository);
        },
        child: _buildContent()
      ),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<ComplitShBloc, ComplitShState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == false) {
          context.read<ComplitShBloc>().add(ComplitShipmentsGet());
          return Text('Получение данных...');
        }
        else {
          return Padding( 
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: state.complits.length,
              itemBuilder: (context, index) => _itemCard(state.complits[index]),
            ),
          );
        }
      }
    );
  }

  Widget _itemCard(ComplitSh shComplit) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text('${shComplit.number_order}'),
            subtitle: Text('\n${sm.getProduct(shComplit.shipments)}\n${shComplit.date_shipments}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(width: 8),
              TextButton(
                child: const Text('Подробнее'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ComplitShDetals(shComplit))
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}