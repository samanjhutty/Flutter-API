import 'package:api/models/users_models.dart';
import 'package:flutter/cupertino.dart';
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
  Widget build(BuildContext context) => CupertinoPopupSurface(
      child: Container(
          color: Colors.grey[300],
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: DefaultTextStyle(
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[850],
                    fontSize: 15),
                child: Table(children: [
                  TableRow(decoration: const BoxDecoration(), children: [
                    const Text('Name'),
                    Text(widget.data![widget.id].name.toString())
                  ]),
                  TableRow(children: [
                    const Text('Username'),
                    Text(widget.data![widget.id].username.toString())
                  ]),
                  TableRow(children: [
                    const Text('Email'),
                    Text(widget.data![widget.id].email.toString())
                  ]),
                  TableRow(children: [
                    const Text('Address'),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Street: ${widget.data![widget.id].address!.street}'),
                          Text(
                              'Suite: ${widget.data![widget.id].address!.suite}'),
                          Text(
                              'City: ${widget.data![widget.id].address!.city}'),
                          Text(
                              'City: ${widget.data![widget.id].address!.zipcode}'),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Geo:'),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'lat: ${widget.data![widget.id].address!.geo!.lat}'),
                                      Text(
                                          'lng: ${widget.data![widget.id].address!.geo!.lng}')
                                    ])
                              ])
                        ])
                  ]),
                  TableRow(children: [
                    const Text('Phone'),
                    Text(widget.data![widget.id].phone.toString())
                  ]),
                  TableRow(children: [
                    const Text('Website'),
                    Text(widget.data![widget.id].website.toString())
                  ]),
                  TableRow(children: [
                    const Text('Company'),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Name: ${widget.data![widget.id].company!.name}'),
                          Text(
                              'Catchphrase: ${widget.data![widget.id].company!.catchPhrase}'),
                          Text('BS: ${widget.data![widget.id].company!.bs}')
                        ])
                  ])
                ])),
          )));
}
