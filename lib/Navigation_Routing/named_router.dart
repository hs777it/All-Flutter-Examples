import 'package:flutter/material.dart';

void main() {
runApp(MaterialApp(
	title: 'Named Routes',
	initialRoute: '/',
	routes: {
	'/': (context) => const firstRoute(),
	'/second': (context) => const secondRoute(),
	},
));
}

// ignore: camel_case_types
class firstRoute extends StatelessWidget {
  const firstRoute({super.key});


@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text('GFG First Route'),
		backgroundColor: Colors.green,
	),
	body: Center(
		child: ElevatedButton(
		child: const Text('Launch screen'),
		onPressed: () {
			Navigator.pushNamed(context, '/second');
		},
		), // Elevated

		// RaisedButton is deprecated now
		// child: RaisedButton(
		// child: const Text('Launch screen'),
		// onPressed: () {
		//	 Navigator.pushNamed(context, '/second');
		// },
		// ),
	),
	);
}
}

// ignore: camel_case_types
class secondRoute extends StatelessWidget {
const secondRoute({super.key});

@override
// ignore: dead_code
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: const Text("GFG Second Route"),
		backgroundColor: Colors.green,
	),
	body: Center(
		child: ElevatedButton(
		onPressed: () {
			Navigator.pop(context);
		},
		child: const Text('Go back!'),
		), // ElevatedButton
	),

	// RaisedButton is deprecated now
	// child: RaisedButton(
	// onPressed: () {
	//	 Navigator.pop(context);
	// },
	// child: const Text('Go back!'),
	// ),
	);
}
}
