import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,

        // App Bar is used to create
        // a bar to give a title for our app
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'GeeksforGeeks',

            // TextStyle is a class
            // where we can modify our text
            style: TextStyle(
              //To assign the color to our text
              color: Colors.green,
            ), //Text Style
          ), //Text

          // backgroundColor is used to
          // change the color of our
          // app bar background
          backgroundColor: Colors.white,
        ), //AppBar

        //Calling the function DicePage()
        body: const DicePage(),
      ), //Scaffold
    ), //Material App
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
// ignore: library_private_types_in_public_api
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // Here we are using the row.
      // Instead of row we can also use column only
      // the alignment of icon will change and other
      // function remains same
      child: Row(
        children: <Widget>[
          // For Image 1
          Expanded(
            flex: 2,
            child: TextButton(
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: Image.asset('assets/images/dice1.png'),
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: TextButton(
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: Image.asset('assets/images/dice2.png'),
              ),
              onPressed: () {},
            ),
          ), //Expanded
        ], //<Widget>
      ), //Row
    ); //center
  }
}
