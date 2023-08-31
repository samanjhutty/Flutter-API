import 'package:api/tabs/albums.dart';
import 'package:api/tabs/photos.dart';
import 'package:api/tabs/posts.dart';
import 'package:api/tabs/todos.dart';
import 'package:api/tabs/users.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
      home: MainTab(title: 'Flutter API'), title: 'Flutter API');
}

class MainTab extends StatefulWidget {
  const MainTab({required this.title, super.key});
  final String title;
  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with TickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> _topTabs = const [
    Tab(icon: Icon(Icons.feed), text: 'Posts'),
    Tab(icon: Icon(Icons.photo_album), text: 'Album'),
    Tab(icon: Icon(Icons.photo), text: 'Photos'),
    Tab(icon: Icon(Icons.today_outlined), text: 'Todo'),
    Tab(icon: Icon(Icons.person), text: 'Users')
  ];

  @override
  void initState() {
    _tabController = TabController(length: _topTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            elevation: 0,
            foregroundColor: Colors.blue[900],
            backgroundColor: Colors.white,
            bottom: TabBar(
              tabs: _topTabs,
              controller: _tabController,
              labelColor: Colors.blue[800],
              unselectedLabelColor: Colors.black45,
            )),
        body: TabBarView(
          controller: _tabController,
          children: const [Posts(), Albums(), Photos(), Todos(), Users()],
        ),
      );
}

Widget? noData({required VoidCallback data}) =>
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const CircularProgressIndicator(),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: TextButton(onPressed: data, child: const Text('Refresh')),
      )
    ]);
