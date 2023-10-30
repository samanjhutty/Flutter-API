import 'dart:ui';
import 'package:api/main.dart';
import 'package:api/models/users_models.dart';
import 'package:api/widgets/user_details.dart';
import 'package:api/provider/api_services.dart';
import 'package:flutter/material.dart';

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
    _userData = await ApiServices().getUsers();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
        child: _userData!.isEmpty
            ? noData(data: () => _getUserData())
            : Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Card(
                    color: scheme.secondaryContainer,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DefaultTextStyle(
                        style: TextStyle(
                            color: scheme.onSecondaryContainer,
                            fontWeight: FontWeight.w900,
                            fontFeatures: const [FontFeature.swash()]),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 24),
                                  child: Text('S.no')),
                              Expanded(child: Text('Name')),
                              Expanded(child: Text('Email')),
                              Expanded(child: Text('Company')),
                            ]),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: _userData!.length,
                      itemBuilder: (context, i) => Card(
                            child: InkWell(
                                onTap: () => showDialog(
                                    context: context,
                                    builder: ((_) =>
                                        UserDetails(id: i, data: _userData))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 16),
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
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            _userData![i].email.toString(),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                              _userData![i]
                                                  .company!
                                                  .name
                                                  .toString(),
                                              textAlign: TextAlign.right),
                                        )
                                      ]),
                                )),
                          )),
                ),
              ]));
  }
}
