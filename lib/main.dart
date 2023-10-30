import 'package:api/tabs/albums.dart';
import 'package:api/tabs/posts.dart';
import 'package:api/tabs/todos.dart';
import 'package:api/tabs/user_details.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  myTheme(Brightness brightness) => ThemeData(
      colorScheme:
          ColorScheme.fromSeed(seedColor: Colors.blue, brightness: brightness),
      useMaterial3: true);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: myTheme(Brightness.light),
        darkTheme: myTheme(Brightness.dark),
        themeMode: ThemeMode.system,
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  final String title = 'Flutter API';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> _topTabs = const [
    Tab(icon: Icon(Icons.feed)),
    Tab(icon: Icon(Icons.photo_album)),
    Tab(icon: Icon(Icons.today_outlined)),
    Tab(icon: Icon(Icons.people_rounded)),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _topTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              dividerColor: Colors.transparent,
              tabs: _topTabs,
              controller: _tabController,
              labelColor: Colors.blue[800],
              unselectedLabelColor: scheme.outlineVariant,
            )),
        body: TabBarView(controller: _tabController, children: const [
          Posts(),
          Albums(id: 0),
          Todos(id: 0),
          UserDetails(id: 0)
        ]));
  }
}

Widget? noData({required VoidCallback data}) =>
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const CircularProgressIndicator(),
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: TextButton(onPressed: data, child: const Text('Refresh')),
      )
    ]);
