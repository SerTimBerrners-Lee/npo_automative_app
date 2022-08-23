import 'package:flutter/material.dart';

class ShipmentsComplitPage extends StatefulWidget  {
  @override 
  _ShipmentsComplitState createState() => _ShipmentsComplitState();
}

class _ShipmentsComplitState extends State<ShipmentsComplitPage> {
  // final Repository repo = new Repository();

  // PostResult currentState = PostResultLoading();

  // void init() async {
  //   try {
  //     final postList = await repo.fetchPosts();
  //     setState(() => currentState = PostResultSuccess(postList));
  //   } catch (error) {
  //     setState(() => currentState = PostResultFailure("Нет Интернета"));
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   init();
  // }

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
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    // final state = currentState;
    // if (state is PostResultLoading) {
    //   // pedding
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
    // } else if (state is PostResultFailure) {
    //   // error 
    //   return Center(
    //     child: Text(
    //       state.error,
    //       textAlign: TextAlign.center,
    //       style: Theme.of(context).textTheme.headline4
    //     ),
    //   );
    // }

    // final posts = (state as PostResultSuccess).postList.posts;
    return Padding( 
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('№ O22-152'),
              subtitle: Text('\nВШ70-200 с тележкой\nВыпрессовщик шкворней ВШ70-200 с тележкой\n04.08.2022'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Подробнее'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
