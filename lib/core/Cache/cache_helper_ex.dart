import 'package:flutter/material.dart';
import 'package:flutter_ex/core/Cache/cache_helper.dart';
import 'package:flutter_ex/core/Cache/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared Preferences",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = getIt<CacheHelper>().getData(key: "counter") ?? 0;

  void counterAction(String action) async {
    setState(() {
      action == '+'
          ? _counter = (getIt<CacheHelper>().getData(key: 'counter') + 1)
          : _counter = (getIt<CacheHelper>().getData(key: 'counter') - 1);

      getIt<CacheHelper>().saveData(key: 'counter', value: _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await getIt<CacheHelper>().saveData(key: "counter", value: _counter + 1);
              setState(() {
                _counter++;
              });
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () async {
              await getIt<CacheHelper>().saveData(key: "counter", value: _counter - 1);
              setState(() {
                _counter--;
              });
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
