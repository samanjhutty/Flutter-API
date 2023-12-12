import 'package:api/view/tabs/albums.dart';
import 'package:api/view/tabs/posts.dart';
import 'package:api/view/tabs/todos.dart';
import 'package:api/view/tabs/user_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  await Hive.openBox('APIbox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  myTheme(Brightness brightness) => ThemeData(
      colorScheme:
          ColorScheme.fromSeed(seedColor: Colors.blue, brightness: brightness),
      useMaterial3: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {'/': (p0) => const HomePage()},
      theme: myTheme(Brightness.light),
      darkTheme: myTheme(Brightness.dark),
      themeMode: ThemeMode.system,
    );
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
    final int id = Hive.box('APIbox').get('id', defaultValue: 1);

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
        body: TabBarView(controller: _tabController, children: [
          const Posts(),
          Albums(userId: id),
          Todos(userId: id),
          UserDetails(userId: id)
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
