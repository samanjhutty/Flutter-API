import 'package:api/models/users_models.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key, required this.id, required this.data});

  final int id;
  final List<UsersModel>? data;
  @override
  State<StatefulWidget> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) => AlertDialog(
        insetPadding: const EdgeInsets.all(16),
        actions: [
          TextButton(
              style: TextButton.styleFrom(alignment: Alignment.center),
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'))
        ],
        actionsPadding: const EdgeInsets.only(bottom: 16),
        actionsAlignment: MainAxisAlignment.center,
        title: const Text('User Details'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DefaultTextStyle(
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[850],
                  fontSize: 15),
              child: Table(children: [
                TableRow(decoration: const BoxDecoration(), children: [
                  const Text('Name',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.data![widget.id].name.toString())
                ]),
                TableRow(children: [
                  const Text('Username',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.data![widget.id].username.toString())
                ]),
                TableRow(children: [
                  const Text('Email',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.data![widget.id].email.toString())
                ]),
                TableRow(children: [
                  const Text('Address',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(children: [
                          const Text('Street:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.data![widget.id].address!.street!),
                        ]),
                        Wrap(children: [
                          const Text('Suite:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.data![widget.id].address!.suite!),
                        ]),
                        Wrap(
                          children: [
                            const Text('City:',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(widget.data![widget.id].address!.city!),
                          ],
                        ),
                        Wrap(
                          children: [
                            const Text('Zip Code:',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(widget.data![widget.id].address!.zipcode!),
                          ],
                        ),
                        Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              const Text('Geo:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Wrap(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: [
                                    Wrap(children: [
                                      const Text('lat:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(widget
                                          .data![widget.id].address!.geo!.lat!),
                                    ]),
                                    Wrap(children: [
                                      const Text('lng:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(widget
                                          .data![widget.id].address!.geo!.lng!),
                                    ])
                                  ])
                            ])
                      ])
                ]),
                TableRow(children: [
                  const Text('Phone',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.data![widget.id].phone.toString())
                ]),
                TableRow(children: [
                  const Text('Website',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.data![widget.id].website.toString())
                ]),
                TableRow(children: [
                  const Text('Company',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(children: [
                          const Text('Name:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.data![widget.id].company!.name!),
                        ]),
                        Wrap(children: [
                          const Text('Catchphrase:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.data![widget.id].company!.catchPhrase!)
                        ]),
                        Wrap(children: [
                          const Text('BS:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(widget.data![widget.id].company!.bs!),
                        ])
                      ])
                ])
              ])),
        ),
      );
}
