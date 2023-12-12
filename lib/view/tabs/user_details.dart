import 'package:api/controller/api-services/api_delete.dart';
import 'package:api/main.dart';
import 'package:api/models/users_models.dart';
import 'package:api/view/add-widgets/add_user.dart';
import 'package:api/view/widgets/assets.dart';
import 'package:api/view/widgets/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/api-services/api_get.dart';

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
    List<UsersModel>? data = await ApiGetServices().getUsers();
    Future.delayed(const Duration(milliseconds: 1))
        .then((value) => setState(() {
              for (int i = 0; i < data!.length; i++) {
                if (data[i].id == widget.userId) {
                  _userData = data[i];
                  break;
                }
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    double tablerowspacing = MediaQuery.of(context).size.height * 0.005;

    return _userData == null
        ? Center(child: noData(data: _getUserData))
        : Column(children: [
            Container(
                color: scheme.surface,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 4),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('User Details',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.grey))
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
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                      myTableRowDivider(context),
                      TableRow(children: [
                        const Text('Phone',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(_userData!.phone.toString())
                      ]),
                      myTableRowDivider(context),
                      TableRow(children: [
                        const Text('Website',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(_userData!.website!)
                      ]),
                      myTableRowDivider(context),
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
                              SizedBox(height: tablerowspacing),
                              Wrap(children: [
                                const Text('Catchphrase:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(_userData!.company!.catchPhrase!)
                              ]),
                              SizedBox(height: tablerowspacing),
                              Wrap(children: [
                                const Text('Description:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(_userData!.company!.bs!),
                              ])
                            ])
                      ]),
                      myTableRowDivider(context),
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
                              SizedBox(height: tablerowspacing),
                              Wrap(children: [
                                const Text('Suite:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(_userData!.address!.suite!),
                              ]),
                              SizedBox(height: tablerowspacing),
                              Wrap(children: [
                                const Text('City:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(_userData!.address!.city!),
                              ]),
                              SizedBox(height: tablerowspacing),
                              Wrap(children: [
                                const Text('Zip Code:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(_userData!.address!.zipcode!),
                              ]),
                              SizedBox(height: tablerowspacing),
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
                                          ]),
                                        ]),
                                  ]),
                            ]),
                      ]),
                    ])),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(16),
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Expanded(
                      flex: 5,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)))),
                          onPressed: () => showDialog(
                              context: context, builder: (_) => const Users()),
                          child: const Text('Switch User'))),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Tooltip(
                    richMessage: const TextSpan(text: 'Add User'),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)))),
                        onPressed: () => mydialog(
                            context: context,
                            title: 'Create User',
                            content: 'Do you wich to create a new User',
                            ontap: () => Get.off(() => const AddUser())),
                        child: const Icon(Icons.add_rounded)),
                  )),
                  const SizedBox(width: 8),
                  PopupMenuButton(
                      icon: Icon(Icons.more_vert, color: scheme.primary),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      itemBuilder: (context) => <PopupMenuEntry>[
                            PopupMenuItem(
                                child: const Row(children: [
                                  Icon(Icons.edit),
                                  SizedBox(width: 16),
                                  Text('Edit')
                                ]),
                                onTap: () {
                                  Get.back();
                                }),
                            PopupMenuItem(
                                child: Row(children: [
                                  Icon(
                                    Icons.delete,
                                    color: scheme.error,
                                  ),
                                  const SizedBox(width: 16),
                                  const Text('Delete')
                                ]),
                                onTap: () => mydialog(
                                    context: context,
                                    title: 'Delete User',
                                    content:
                                        'Do you wich to Delete the current User',
                                    ontap: () async {
                                      Get.back();
                                      await ApiDeleteServices()
                                          .deleteUser(id: widget.userId);
                                      setState(() {});
                                    }))
                          ])
                ]))
          ]);
  }
}
