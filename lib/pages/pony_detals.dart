import 'package:flutter/material.dart';
import 'package:npo_automative_app/pages/pony_list.dart';


class PonyDetals extends StatelessWidget {
  final int ponyId;

  PonyDetals(this.ponyId);

  @override
  Widget build(BuildContext context) {
    final pony = ponies[ponyId];
    return Scaffold(
      appBar: AppBar(
        title: Text("Pony Detals"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.pinkAccent,
              ),
              child: Text(
                pony.name,
                style: Theme.of(context).textTheme.headline4 //?.copyWidth(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                pony.desc,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
