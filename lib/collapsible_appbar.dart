import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Collapsible AppBar',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final expandedHeight = MediaQuery.of(context).size.height * 0.2;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: GestureDetector(
              onTap: () => {},
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            flexibleSpace: LayoutBuilder(builder: (context, constraints) {
              final fraction = max(0, constraints.biggest.height - kToolbarHeight) /
                  (expandedHeight - kToolbarHeight);
              return FlexibleSpaceBar(
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 24 * (1 - fraction)),
                          child: const Text.rich(
                            TextSpan(
                                text: "Buffet Deal\n",
                                style: TextStyle(color: Colors.black, fontSize: 14),
                                children: [
                                  TextSpan(
                                    text: "Flash Deal",
                                    style: TextStyle(color: Colors.black, fontSize: 10),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                      const SizedBox(width: 18)
                    ],
                  ),
                ),
                background: Align(
                  alignment: Alignment.centerRight,
                  child: Image.network(
                    "https://picsum.photos/400/200",
                  ),
                ),
              );
            }),
            expandedHeight: MediaQuery.of(context).size.height * 0.2,
            backgroundColor: const Color(0xFFFFF4F4),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 1000))
        ],
      ),
    );
  }
}
