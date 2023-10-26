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
  List<CommentsModel>? list = [];
  @override
  void initState() {
    _getCommentsData();
    super.initState();
  }

  void _getCommentsData() async {
    list = await ApiServices().getComments(widget.postId!);
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
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
        body: list!.isEmpty
            ? Center(child: noData(data: _getCommentsData))
            : ListView.builder(
                itemCount: list?.length,
                itemBuilder: (context, index) => const ListTile()));
  }
}
