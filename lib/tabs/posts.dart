import 'package:api/main.dart';
import 'package:api/models/posts_model.dart';
import 'package:api/provider/api_services.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});
  @override
  State<Posts> createState() => _PostState();
}

class _PostState extends State<Posts> {
  List<PostsModel>? list = [];

  @override
  void initState() {
    _getPostsData();
    super.initState();
  }

  void _getPostsData() async {
    list = await ApiServices().getPosts();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return list!.isEmpty
        ? Center(child: noData(data: _getPostsData))
        : Column(children: [
            Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 4),
                child: const Row(children: [
                  Text('Posts',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey)),
                ])),
            Expanded(
                child: ListView.builder(
              itemCount: list?.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                                child: Text(list![i].userId.toString())),
                            titleTextStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                            title: Text(list![i].title!)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(list![i].body!),
                        ),
                        const Divider(thickness: 0.3)
                      ]),
                );
              },
            ))
          ]);
  }
}
