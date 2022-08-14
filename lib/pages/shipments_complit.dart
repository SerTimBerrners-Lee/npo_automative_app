import 'package:flutter/material.dart';
import 'package:npo_automative_app/data/repository.dart';
import 'package:npo_automative_app/models/post.dart';
import 'package:npo_automative_app/pages/post_add.dart';

class ShipmentsComplitPage extends StatefulWidget  {
  @override 
  _ShipmentsComplitState createState() => _ShipmentsComplitState();
}

class _ShipmentsComplitState extends State<ShipmentsComplitPage> {
  final Repository repo = new Repository();

  PostResult currentState = PostResultLoading();

  void init() async {
    try {
      final postList = await repo.fetchPosts();
      setState(() => currentState = PostResultSuccess(postList));
    } catch (error) {
      setState(() => currentState = PostResultFailure("Нет Интернета"));
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

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
    final state = currentState;
    if (state is PostResultLoading) {
      // pedding
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is PostResultFailure) {
      // error 
      return Center(
        child: Text(
          state.error,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4
        ),
      );
    }

    final posts = (state as PostResultSuccess).postList.posts;
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
  
  Widget _buildPostItem(Post post) {
  return Container(
    decoration: BoxDecoration (
      borderRadius: BorderRadius.all(Radius.circular(15)),
      border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.3)
    ),
    margin: EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: Theme.of(context).primaryColor,
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            post.title!,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Container(
          child: Text(
            post.body!,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          padding: EdgeInsets.all(10)
        )
      ]
    )
  );
}

}
