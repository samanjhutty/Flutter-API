import 'package:api/tabs/albums.dart';
import 'package:api/tabs/posts.dart';
import 'package:api/tabs/todos.dart';
import 'package:api/tabs/users.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(68, 138, 255, 1)),
          useMaterial3: true),
      home: const MainTab(title: 'Flutter API'),
      title: 'Flutter API');
}

class MainTab extends StatefulWidget {
  const MainTab({required this.title, super.key});
  final String title;
  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with TickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> _topTabs = const [
    Tab(icon: Icon(Icons.feed)),
    Tab(icon: Icon(Icons.photo_album)),
    Tab(icon: Icon(Icons.today_outlined)),
    Tab(icon: Icon(Icons.people_rounded))
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
            bottom: TabBar(
              dividerColor: Colors.transparent,
              tabs: _topTabs,
              controller: _tabController,
              labelColor: Colors.blue[800],
              unselectedLabelColor: Colors.black45,
            )),
        body: TabBarView(
          controller: _tabController,
          children: const [Posts(), Albums(), Todos(), Users()],
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
