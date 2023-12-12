import 'package:api/controller/api-services/api_post.dart';
import 'package:api/models/users_models.dart';
import 'package:api/view/widgets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  TextEditingController cNameController = TextEditingController();
  TextEditingController cBsController = TextEditingController();
  TextEditingController cPhraseController = TextEditingController(text: '');
  TextEditingController geoLatController = TextEditingController(text: '');
  TextEditingController geoLngController = TextEditingController(text: '');

  TextEditingController adrCityController = TextEditingController();
  TextEditingController adrZipController = TextEditingController();
  TextEditingController adrStreetController = TextEditingController();
  TextEditingController adrSuiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return Material(
        child: SafeArea(
            child: Scaffold(
      appBar: myAppBar(),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('User Details',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: scheme.primary)),
            const Text('Add a New User',
                style: TextStyle(fontWeight: FontWeight.w600)),
            Expanded(
              child: SizedBox(
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 360
                          : 450,
                  child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Name cannot be empty!';
                                } else {
                                  return null;
                                }
                              },
                              controller: nameController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Name')),
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp('[0-9]+'))
                              ],
                              keyboardType: TextInputType.text),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username cannot be empty!';
                                } else {
                                  return null;
                                }
                              },
                              controller: usernameController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Username')),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[A-Za-z0-9]+'))
                              ],
                              keyboardType: TextInputType.name),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email cannot be empty!';
                                } else if (!RegExp(
                                        r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                    .hasMatch(value)) {
                                  return 'Invalid Email';
                                } else {
                                  return null;
                                }
                              },
                              controller: emailController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Email')),
                              keyboardType: TextInputType.emailAddress),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Website cannot be empty!';
                                } else if (!RegExp(
                                        r'^[\w-]+(\.[\w-]+)*(\.[\w-]+)+$')
                                    .hasMatch(value)) {
                                  return 'Invalid Website';
                                } else {
                                  return null;
                                }
                              },
                              controller: websiteController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Website')),
                              keyboardType: TextInputType.text),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone cannot be empty!';
                                } else if (value.length < 10) {
                                  return 'Invalid Number,must be 10 digit long';
                                } else {
                                  return null;
                                }
                              },
                              controller: phoneController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('Phone')),
                              maxLength: 11,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Row(children: [
                            Text('Address',
                                style: TextStyle(fontWeight: FontWeight.w600))
                          ]),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'City cannot be empty!';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: adrCityController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text('City')),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.deny(
                                            RegExp('[0-9]+'))
                                      ],
                                      keyboardType: TextInputType.text),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Suite cannot be empty!';
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: adrSuiteController,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            label: Text('Suite')),
                                        keyboardType: TextInputType.text))
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 23),
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Street cannot be empty!';
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: adrStreetController,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            label: Text('Street')),
                                        keyboardType: TextInputType.text),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Zip cannot be empty!';
                                        } else if (value.length != 10) {
                                          return 'Invalid Zip, must be 10 digit long';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: adrZipController,
                                      maxLength: 10,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text('Zip Code')),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: false)),
                                )
                              ],
                            )),
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Row(children: [
                            Text('Company',
                                style: TextStyle(fontWeight: FontWeight.w600))
                          ]),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Name cannot be empty!';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: cNameController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text('Name')),
                                      keyboardType: TextInputType.text),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'BS cannot be empty!';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: cBsController,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text('Description')),
                                      keyboardType: TextInputType.text),
                                )
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: TextFormField(
                              controller: cPhraseController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text('CatchPhrase'),
                                  hintText: 'Optional'),
                              keyboardType: TextInputType.text),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 16),
                          child: Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20)),
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          await ApiPostServices().createUser(
                                              data: UsersModel(
                                                      name: nameController.text,
                                                      username:
                                                          usernameController
                                                              .text,
                                                      email:
                                                          emailController.text,
                                                      website: websiteController
                                                          .text,
                                                      phone:
                                                          phoneController.text,
                                                      address: Address(
                                                          city: adrCityController
                                                              .text,
                                                          street:
                                                              adrStreetController
                                                                  .text,
                                                          suite:
                                                              adrSuiteController
                                                                  .text,
                                                          zipcode:
                                                              adrZipController
                                                                  .text,
                                                          geo: Geo(
                                                              lat: geoLatController
                                                                  .text,
                                                              lng:
                                                                  geoLngController
                                                                      .text)),
                                                      company: Company(
                                                          name: cNameController.text,
                                                          bs: cBsController.text,
                                                          catchPhrase: cPhraseController.text))
                                                  .toJson());
                                          Get.close(1);
                                        }
                                      },
                                      child: const Text('Save'))),
                            ],
                          ),
                        )
                      ])),
            ),
          ]),
        ),
      ),
    )));
  }
}
