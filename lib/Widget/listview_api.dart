import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ListView Builder",
        theme: ThemeData(primarySwatch: Colors.green),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List data = [];
  Future<String> getData() async {
    var response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    setState(() {
      data = json.decode(response.body);
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listviews"),
      ),
      body: Column(children: [
        ElevatedButton(
          child: const Text('Get Data'),
          onPressed: () => getData(),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: const Color(0xFFF3C45F),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    onTap: () {
                      if (kDebugMode) {
                        print(data[index]["title"]);
                      }
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    // shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.only(
                    //   topRight: Radius.circular(32),
                    //   bottomRight: Radius.circular(32),
                    // )),
                    hoverColor: Colors.green,
                    title: Text(data[index]["title"]),
                    leading: Text(data[index]["id"].toString()),
                    trailing: IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {},
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
