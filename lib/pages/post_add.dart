import 'package:flutter/material.dart';
import 'package:npo_automative_app/data/repository.dart';
import 'package:npo_automative_app/models/post.dart';


class PostDetailPage extends StatefulWidget {
  @override 
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {

  final Repository repo = new Repository();

  void addPost(Post post, void Function(PostAdd) callback) async {
    try {
      final result = await repo.addPost(post);
    } catch(error) {
      callback(PostAddFailure());
    }
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Add Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // request to server
                final post = Post(-1, -1, titleController.text, contentController.text);
                addPost(post, (status) {
                  if (status is PostAddSuccess) {
                    Navigator.pop(context, status);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Произошла ошибка при добавлении поста"))
                    );
                  }
                });
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: _buildContent(),
      )
    );
  }

  Widget _buildContent() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.face),
              hintText: "Заголовок",
            ),
            controller: titleController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Заголовок пустой";
              }
              if (value.length < 3) {
                return "Заголовок должен быть не короче 3 символов";
              }
              return null;
            }
          ),
          // небольшой отступ между полями
          SizedBox(height: 10),
          Expanded(
            child: TextFormField(
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Содержание",
              ),
              controller: contentController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Содержание пустое";
                }
                return null;
              }
            )

          )
        ],
      ),
    );
  }
}