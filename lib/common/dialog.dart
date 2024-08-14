import 'package:flutter/material.dart';

class Dialog {
  Widget alertDialog(String title, String content, Function()? onTap) => AlertDialog(
        title: Text(title), // To display the title it is optional
        content: Text(content), // Message which will be pop up on the screen
        actions: [
          TextButton(
            onPressed: onTap,
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: onTap,
            child: const Text('CANCEL'),
          ),
        ],
      );

  Widget simpleDialog(String title, Function()? onTap) => SimpleDialog(
        title: Text(title),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: onTap,
            child: const Text('Option 1'),
          ),
          SimpleDialogOption(
            onPressed: onTap,
            child: const Text('Option 2'),
          ),
        ],
      );
}
