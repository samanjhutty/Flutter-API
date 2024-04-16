import 'package:api/controller/api-services/api_delete.dart';
import 'package:api/main.dart';
import 'package:api/models/users_models.dart';
import 'package:api/view/add-widgets/add_user.dart';
import 'package:api/view/widgets/assets.dart';
import 'package:api/view/widgets/users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/dbcontroller.dart';

class UserDetails extends GetView<DbController> {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    double tablerowspacing = MediaQuery.of(context).size.height * 0.007;

    return Obx(
      () => controller.isDetailsLoading.value
          ? Center(child: noData(data: controller.getUserData))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                Container(
                    color: scheme.surface,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    margin: const EdgeInsets.only(bottom: 4),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('User Details',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey))
                        ])),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Card(
                    child: ListTile(
                        leading: CircleAvatar(
                            child: Text(
                                controller.userData?.value.id.toString() ??
                                    '')),
                        title: Text(controller.userData?.value.name ?? '',
                            style:
                                const TextStyle(fontWeight: FontWeight.w500)),
                        subtitle: Text(controller.userData?.value.email ?? '',
                            style:
                                const TextStyle(fontWeight: FontWeight.w500))),
                  ),
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => controller.getUserData(),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: scheme.onSurface,
                              fontSize: 15),
                          child: Table(children: [
                            TableRow(children: [
                              const Text('Username',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(controller.userData?.value.username ?? '')
                            ]),
                            myTableRowDivider(context),
                            TableRow(children: [
                              const Text('Phone',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                  controller.userData?.value.phone.toString() ??
                                      '')
                            ]),
                            myTableRowDivider(context),
                            TableRow(children: [
                              const Text('Website',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(controller.userData?.value.website ?? '')
                            ]),
                            myTableRowDivider(context),
                            TableRow(children: [
                              const Text('Company',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(children: [
                                      const Text('Name:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(controller
                                              .userData?.value.company?.name ??
                                          ''),
                                    ]),
                                    SizedBox(height: tablerowspacing),
                                    Wrap(children: [
                                      const Text('Catchphrase:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(controller.userData?.value.company
                                              ?.catchPhrase ??
                                          '')
                                    ]),
                                    SizedBox(height: tablerowspacing),
                                    Wrap(children: [
                                      const Text('Description:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(controller
                                              .userData?.value.company?.bs ??
                                          ''),
                                    ])
                                  ])
                            ]),
                            myTableRowDivider(context),
                            TableRow(children: [
                              const Text('Address',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(children: [
                                      const Text('Street:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(controller.userData?.value.address
                                              ?.street ??
                                          ''),
                                    ]),
                                    SizedBox(height: tablerowspacing),
                                    Wrap(children: [
                                      const Text('Suite:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(controller
                                              .userData?.value.address?.suite ??
                                          ''),
                                    ]),
                                    SizedBox(height: tablerowspacing),
                                    Wrap(children: [
                                      const Text('City:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(controller
                                              .userData?.value.address?.city ??
                                          ''),
                                    ]),
                                    SizedBox(height: tablerowspacing),
                                    Wrap(children: [
                                      const Text('Zip Code:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(controller.userData?.value.address
                                              ?.zipcode ??
                                          ''),
                                    ]),
                                    SizedBox(height: tablerowspacing),
                                    Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
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
                                                  Text(controller
                                                          .userData
                                                          ?.value
                                                          .address
                                                          ?.geo
                                                          ?.lat ??
                                                      ''),
                                                ]),
                                                Wrap(children: [
                                                  const Text('lng:',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(controller
                                                          .userData
                                                          ?.value
                                                          .address
                                                          ?.geo
                                                          ?.lng ??
                                                      ''),
                                                ]),
                                              ]),
                                        ]),
                                  ]),
                            ]),
                          ])),
                    ),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4)))),
                              onPressed: () => showDialog(
                                  context: context,
                                  builder: (_) => const Users()),
                              child: const Text('Switch User'))),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Tooltip(
                        richMessage: const TextSpan(text: 'Add User'),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)))),
                            onPressed: () => mydialog(
                                context: context,
                                title: 'Create User',
                                content: const Text(
                                    'Do you wich to create a new User'),
                                ontap: () => Get.offNamed('/add-user')),
                            child: const Icon(Icons.add_rounded)),
                      )),
                      const SizedBox(width: 8),
                      moreButton(
                          scheme: scheme,
                          editTap: () => Get.to(() => AddUser(
                              data:
                                  controller.userData?.value ?? UsersModel())),
                          deleteTap: () async {
                            await ApiDeleteServices()
                                .deleteUser(id: controller.userId);
                            Get.close(1);
                          },
                          content: 'User')
                    ]))
              ])),
    );
  }
}
