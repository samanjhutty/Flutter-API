import 'package:api/models/comments_model.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../provider/api_services.dart';

class Comments extends StatefulWidget {
  const Comments({super.key, required this.postId});

  final int? postId;
  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  List<CommentsModel>? commentData = [];
  @override
  void initState() {
    _getCommentsData();
    super.initState();
  }

  void _getCommentsData() async {
    List<CommentsModel>? data = await ApiServices().getComments();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {
              for (int i = 0; i < data!.length; i++) {
                if (data[i].postId == widget.postId) {
                  commentData!.add(data[i]);
                }
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                iconSize: 20,
                splashRadius: 16,
                color: Colors.grey,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                )),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.grey),
            title: const Text('Comments')),
        body: commentData!.isEmpty
            ? Center(child: noData(data: _getCommentsData))
            : ListView.builder(
                itemCount: commentData?.length,
                itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                child: Text(commentData![i].id.toString())),
                            contentPadding: EdgeInsets.zero,
                            title: Text(commentData![i].name!),
                            titleTextStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: scheme.onSurface),
                            subtitle: Text(commentData![i].email!),
                            subtitleTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 16, right: 8),
                              child: Text(
                                commentData![i].body!,
                                style: const TextStyle(color: Colors.grey),
                              )),
                        ],
                      ),
                    )));
  }
}
