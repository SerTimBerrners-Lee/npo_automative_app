import 'package:flutter/material.dart';
import 'package:npo_automative_app/data/repository.dart';
import 'package:npo_automative_app/models/post.dart';
import 'package:npo_automative_app/pages/post_add.dart';
import 'package:npo_automative_app/pages/profile.dart';
import 'package:npo_automative_app/pages/shipments_complit.dart';

class MenyListPage extends StatefulWidget  {
  @override 
  _MenyListPageState createState() => _MenyListPageState();
}

class _MenyListPageState extends State<MenyListPage> {
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
        title: Text("Меню"),
        shadowColor: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: _buildContent(context),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.push(context, 
      //       MaterialPageRoute(
      //         builder: (context) => PostDetailPage()
      //       ),
      //     ).then((val) {
      //       print('test hello');
      //       if (val is PostAddSuccess) {
      //         ScaffoldMessenger.of(context).showSnackBar(
      //           SnackBar(content: Text("Пост был успешно добавлен"))
      //         );
      //       }
      //     });
      //   },
      // ),
    );
  }

  Widget _buildContent(BuildContext context) {
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
