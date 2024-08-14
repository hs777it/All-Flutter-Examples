import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 120,
      height: 70,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 3),
          CircularProgressIndicator(
            strokeWidth: 1.5,
            color: Colors.grey,
            backgroundColor: Colors.orange,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          SizedBox(height: 3),
          Text('Loading...', style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }
}
