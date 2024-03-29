import 'dart:ui';
import 'package:api/main.dart';
import 'package:api/models/users_models.dart';
import 'package:api/controller/api-services/api_get.dart';
import 'package:api/view/widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<UsersModel>? _userData = [];
  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    _userData = await ApiGetServices().getUsers();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          TextButton(
              style: TextButton.styleFrom(alignment: Alignment.center),
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'))
        ],
        contentPadding: const EdgeInsets.all(8),
        actionsPadding: const EdgeInsets.only(bottom: 16, right: 16),
        insetPadding: const EdgeInsets.all(16),
        actionsAlignment: MainAxisAlignment.end,
        title: const Text('Switch User'),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: _userData!.isEmpty
              ? Center(child: noData(data: () => _getUserData()))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _userData!.length,
                  itemBuilder: (context, i) => Card(
                        child: InkWell(
                            onTap: () async {
                              setState(() {
                                if (box.get('id') == _userData![i].id) {
                                  Navigator.pop(context);
                                } else {
                                  box.put('id', _userData![i].id);
                                }
                              });
                              Navigator.pop(context);
                              Get.offAllNamed('/');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: CircleAvatar(
                                          radius: 16,
                                          child: Text(
                                              _userData![i].id.toString())),
                                    ),
                                    Expanded(
                                        child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 8),
                                            child: Text(
                                              _userData![i].name.toString(),
                                              style: const TextStyle(
                                                  fontFeatures: [
                                                    FontFeature.swash()
                                                  ],
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.left,
                                            ))),
                                    Expanded(
                                        child: Text(
                                      _userData![i].email.toString(),
                                      textAlign: TextAlign.left,
                                    )),
                                  ]),
                            )),
                      )),
        ));
  }
}
