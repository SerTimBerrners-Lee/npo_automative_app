import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:npo_automative_app/data/repository.dart';
import 'package:npo_automative_app/models/photo.dart';

class AlbumListPage extends StatefulWidget  {
  @override 
  _AlbumListPageState createState() => _AlbumListPageState();
}

class _AlbumListPageState extends State<AlbumListPage> {
  final fileImages = [
    "1.png",
    "2.png",
    "3.png",
    "4.png",
    "5.png",
    "desk.png",
  ];

  final Repository repo = Repository();
  PhotoResult currentState = PhotoResultLoading();

   void init() async {
    try {
      final photoList = await repo.fetchPhotos();
      setState(() => currentState = PhotoResultSuccess(photoList));
    } catch (error) {
      setState(() => currentState = PhotoResultFailure("Нет интернета"));
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
        title: Text("Album List Page",)
      ),
      body: _buildContentFetch()
    );
  }

  Widget _buildContent() {
    return StaggeredGridView.countBuilder(
      itemCount: fileImages.length,
      crossAxisCount: 8,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      staggeredTileBuilder: (index) {
        return StaggeredTile.count(4, index % 2 == 0 ? 4 : 8);
      },
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pinkAccent, width: 1)
          ),
          child: Image.asset("images/${fileImages[index]}"),
        );
      },
    );
  }

  Widget _buildContentFetch() {
    final state = currentState;
    if (state is PhotoResultLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is PhotoResultFailure) {
      return Center(
        child: Text(
          state.error,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.red)
        ),
      );
    } 
    
    final images = (state as PhotoResultSuccess).photoList.photos;
    return StaggeredGridView.countBuilder(
      itemCount: fileImages.length,
      crossAxisCount: 8,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      staggeredTileBuilder: (index) {
        return StaggeredTile.count(4, index % 2 == 0 ? 4 : 8);
      },
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.pinkAccent, width: 1)
          ),
          child: Image.network(
            images[index].url,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (ctx, widget, imageChunkEvent) {
              if (imageChunkEvent == null) return widget;
              return Center(child: Text("Loading..."));
            },
            errorBuilder: (context, obj, stacktrace) => Center(child: Text("Error!")),
          ),
        );
      },
    );
  }
}