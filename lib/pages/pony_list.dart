import 'package:flutter/material.dart';
import 'package:npo_automative_app/pages/pony_detals.dart';

class Pony {
  final int id;
  final String name;
  final String desc;

  Pony(this.id, this.name, this.desc);
}

final List<Pony> ponies = [
  Pony(
      0,
      "Twillight Sparkle",
      "Twilight Sparkle is the central main character of My Little Pony Friendship is Magic. She is a female unicorn pony who transforms into an Alicorn and becomes a princess in Magical Mystery Cure"
  ),
  Pony(
      1,
      "Starlight Glimmer",
      "Starlight Glimmer is a female unicorn pony and recurring character, initially an antagonist but later a protagonist, in the series. She first possibly appears in My Little Pony: Friends Forever Issue and first explicitly appears in the season five premiere."
  ),
  Pony(
      2,
      "Applejack",
      "Applejack is a female Earth pony and one of the main characters of My Little Pony Friendship is Magic. She lives and works at Sweet Apple Acres with her grandmother Granny Smith, her older brother Big McIntosh, her younger sister Apple Bloom, and her dog Winona. She represents the element of honesty."
  ),
  Pony(
      3,
      "Pinkie Pie",
      "Pinkie Pie, full name Pinkamena Diane Pie,[note 2] is a female Earth pony and one of the main characters of My Little Pony Friendship is Magic. She is an energetic and sociable baker at Sugarcube Corner, where she lives on the second floor with her toothless pet alligator Gummy, and she represents the element of laughter."
  ),
  Pony(
      4,
      "Fluttershy",
      "Fluttershy is a female Pegasus pony and one of the main characters of My Little Pony Friendship is Magic. She lives in a small cottage near the Everfree Forest and takes care of animals, the most prominent of her charges being Angel the bunny. She represents the element of kindness."
  ),
];

class PonyListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pony List Page")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: ListView(
          children: ponies.map<Widget>((pony) {
            return Material(
              color: Colors.pinkAccent,
              child: InkWell(
                splashColor: Colors.pink,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute( 
                    builder: (context) => PonyDetals(pony.id)
                  ));
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    pony.name,
                    style: Theme.of(context).textTheme.headline4
                  )
                ),
              ),
            );
          }).toList(),
        )
      ),
    );
  }
}