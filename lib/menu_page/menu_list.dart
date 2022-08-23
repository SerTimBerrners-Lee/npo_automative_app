import 'package:npo_automative_app/shipments_complit/shipments_complit.dart';
import 'package:flutter/material.dart';

class MenyListPage extends StatelessWidget  {
  @override 
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text("Меню"),
        shadowColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding( 
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          final inx = index + 1;
          return Card(
            child: ListTile(
              title: Text("$inx. Отгруженные заказы"),
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => ShipmentsComplitPage()
                  ),
                );
              },  
            ),
            elevation: 8,
            shadowColor: Colors.grey,
            margin: EdgeInsets.all(10),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.deepPurple, width: 0.2)
            ),
          );
          
          //_buildPostItem(posts[index]);
        }
      ),
    );
  }
}
