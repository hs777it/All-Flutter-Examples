// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';


// // https://pub.dev/packages/webview_universal
// // https://pub.dev/packages/flutter_inappwebview

// class WebViewScreen extends StatefulWidget {
//   final String url;
//   const WebViewScreen({super.key, required this.url});

//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   WebViewController webViewController = WebViewController();

//   @override
//   void initState() {
//     super.initState();
//     webViewController.init(
//       context: context,
//       setState: setState,
//       uri: Uri.parse(widget.url),
//     );
//   }

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
//         body:
//             // WebView(initialUrl: widget.url),
//             WebView(controller: webViewController),
//       ),
//     );
//   }
// }
