import 'package:flutter/material.dart';
import 'package:flutter_ex/common/images.dart';
import 'package:sticky_headers/sticky_headers.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sticky Headers',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      title: 'Sticky Headers Example',
      child: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: <Widget>[
            ListTile(
              title: const Text('Example 1 - Headers and Content'),
              onTap: () => navigateTo(context, (context) => const Example1()),
            ),
            ListTile(
              title: const Text('Example 2 - Animated Headers with Content'),
              onTap: () => navigateTo(context, (context) => const Example2()),
            ),
            ListTile(
              title: const Text('Example 3 - Headers overlapping the Content'),
              onTap: () => navigateTo(context, (context) => const Example3()),
            ),
            ListTile(
              title: const Text('Example 4 - Example using scroll controller'),
              onTap: () => navigateTo(context, (context) => const Example4()),
            ),
          ],
        ).toList(growable: false),
      ),
    );
  }

  void navigateTo(BuildContext context, WidgetBuilder builder) {
    Navigator.of(context).push(MaterialPageRoute(builder: builder));
  }
}

class Example1 extends StatelessWidget {
  const Example1({
    super.key,
    this.controller,
  });

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      wrap: controller == null,
      title: 'Example 1',
      child: ListView.builder(
        primary: controller == null,
        controller: controller,
        itemBuilder: (context, index) {
          return StickyHeader(
            controller: controller, // Optional
            header: Container(
              height: 50.0,
              color: Colors.blueGrey[700],
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Header #$index',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            content: Container(
              color: Colors.grey[300],
              child: Image.network(
                imageForIndex(index),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            ),
          );
        },
      ),
    );
  }

  String imageForIndex(int index) {
    return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
  }
}

class Example2 extends StatelessWidget {
  const Example2({
    super.key,
    this.controller,
  });

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      wrap: controller == null,
      title: 'Example 2',
      child: ListView.builder(
        primary: controller == null,
        controller: controller,
        itemBuilder: (context, index) {
          return StickyHeaderBuilder(
            controller: controller, // Optional
            builder: (BuildContext context, double stuckAmount) {
              stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
              return Container(
                height: 50.0,
                color: Color.lerp(Colors.blue[700], Colors.red[700], stuckAmount),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Header #$index',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Offstage(
                      offstage: stuckAmount <= 0.0,
                      child: Opacity(
                        opacity: stuckAmount,
                        child: IconButton(
                          icon: const Icon(Icons.favorite, color: Colors.white),
                          onPressed: () => ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Favorite #$index'))),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            content: Container(
              color: Colors.grey[300],
              child: Image.network(
                imageForIndex(index),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            ),
          );
        },
      ),
    );
  }

  String imageForIndex(int index) {
    return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
  }
}

class Example3 extends StatelessWidget {
  const Example3({
    super.key,
    this.controller,
  });

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWrapper(
      wrap: controller == null,
      title: 'Example 3',
      child: ListView.builder(
        primary: controller == null,
        controller: controller,
        itemBuilder: (context, index) {
          return StickyHeaderBuilder(
            overlapHeaders: true,
            controller: controller, // Optional
            builder: (BuildContext context, double stuckAmount) {
              stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
              return Container(
                height: 50.0,
                color: Colors.grey.shade900.withOpacity(0.6 + stuckAmount * 0.4),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Header #$index',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
            content: Container(
              color: Colors.grey[300],
              child: Image.network(
                imageForIndex(index),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            ),
          );
        },
      ),
    );
  }

  String imageForIndex(int index) {
    return Images.imageThumbUrls[index % Images.imageThumbUrls.length];
  }
}

class Example4 extends StatefulWidget {
  const Example4({super.key});

  @override
  State<Example4> createState() => _Example4State();
}

class _Example4State extends State<Example4> {
  late final _controller = List.generate(4, (_) => ScrollController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: _controller[0],
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text('Example 4'),
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                bottom: const TabBar(
                  tabs: <Tab>[
                    Tab(text: 'Example 1'),
                    Tab(text: 'Example 2'),
                    Tab(text: 'Example 3'),
                  ],
                ),
              ),
            ];
          },
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: TabBarView(
              children: <Widget>[
                Example1(controller: _controller[1]),
                Example2(controller: _controller[2]),
                Example3(controller: _controller[3]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScaffoldWrapper extends StatelessWidget {
  const ScaffoldWrapper({
    super.key,
    required this.title,
    required this.child,
    this.wrap = true,
  });

  final Widget child;
  final String title;
  final bool wrap;

  @override
  Widget build(BuildContext context) {
    if (wrap) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Hero(
            tag: 'app_bar',
            child: AppBar(
              title: Text(title),
              elevation: 0.0,
            ),
          ),
        ),
        body: child,
      );
    } else {
      return Material(
        child: child,
      );
    }
  }
}