// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart'; // webview_flutter 3.0.4

// class WebViewScreen extends StatefulWidget {
//   final String url;
//   const WebViewScreen({super.key, required this.url});

//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: Theme.of(context),
//       child: Scaffold(
//         appBar: AppBar(
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 if (!await launchUrl(Uri.parse(widget.url))) {
//                   throw Exception('Could not launch ${widget.url}');
//                 }
//               },
//               child: const Text("فتح في المتصفح"),
//             ),
//           ],
//         ),
//         body: WebView(initialUrl: widget.url),
//       ),
//     );
//   }
// }
