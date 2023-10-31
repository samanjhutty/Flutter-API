import 'package:api/main.dart';
import 'package:api/models/users_models.dart';
import 'package:api/widgets/users.dart';
import 'package:flutter/material.dart';

import '../provider/api_services.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key, required this.userId});

  final int userId;
  @override
  State<StatefulWidget> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  UsersModel? _userData;
  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    List<UsersModel>? data = await ApiServices().getUsers();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {
              for (int i = 0; i < data!.length; i++) {
                if (data[i].id == widget.userId) {
                  _userData = data[i];
                }
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return _userData == null
        ? Center(child: noData(data: _getUserData))
        : Column(children: [
            Container(
                color: scheme.surface,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 4),
                child: const Row(children: [
                  Text('User Details',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.grey)),
                ])),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Card(
                child: ListTile(
                    leading:
                        CircleAvatar(child: Text(_userData!.id.toString())),
                    title: Text(_userData!.name!,
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(_userData!.email!,
                        style: const TextStyle(fontWeight: FontWeight.w500))),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SingleChildScrollView(
                child: DefaultTextStyle(
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: scheme.onSurface,
                        fontSize: 15),
                    child: Table(children: [
                      TableRow(children: [
                        const Text('Username',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(_userData!.username!)
                      ]),
                      TableRow(children: [
                        const Text('Phone',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(_userData!.phone.toString())
                      ]),
                      TableRow(children: [
                        const Text('Website',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(_userData!.website!)
                      ]),
                      TableRow(children: [
                        const Text('Company',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(children: [
                                const Text('Name:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(_userData!.company!.name!),
                              ]),
                              Wrap(children: [
                                const Text('Catchphrase:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(_userData!.company!.catchPhrase!)
                              ]),
                              Wrap(children: [
                                const Text('BS:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(_userData!.company!.bs!),
                              ])
                            ])
                      ]),
                      TableRow(children: [
                        const Text('Address',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(children: [
                                const Text('Street:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(_userData!.address!.street!),
                              ]),
                              Wrap(children: [
                                const Text('Suite:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(_userData!.address!.suite!),
                              ]),
                              Wrap(
                                children: [
                                  const Text('City:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(_userData!.address!.city!),
                                ],
                              ),
                              Wrap(
                                children: [
                                  const Text('Zip Code:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(_userData!.address!.zipcode!),
                                ],
                              ),
                              Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    const Text('Geo:',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Wrap(
                                        direction: Axis.vertical,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        children: [
                                          Wrap(children: [
                                            const Text('lat:',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(_userData!.address!.geo!.lat!),
                                          ]),
                                          Wrap(children: [
                                            const Text('lng:',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(_userData!.address!.geo!.lng!),
                                          ])
                                        ])
                                  ])
                            ])
                      ]),
                    ])),
              ),
            )),
            Container(
                margin: const EdgeInsets.all(16),
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)))),
                        onPressed: () => showDialog(
                            context: context, builder: (_) => const Users()),
                        child: const Text('Switch User')),
                  )
                ]))
          ]);
  }
}
