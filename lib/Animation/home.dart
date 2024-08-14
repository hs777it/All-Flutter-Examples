import 'package:flutter/material.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: GestureDetector(
        onTap: () {},
        child: Hero(
          tag: 'heroTag',
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
      ),
    );
  }
}
