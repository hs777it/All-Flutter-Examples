import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key, required this.url});

  final String url;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final WebViewController _controller = WebViewController();
  String pageTitle = '-';
  double progressVal = 0;

  @override
  void initState() {
    super.initState();
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (progress) => setState(() => progressVal = progress / 100),
        onPageStarted: (url) => setState(() => pageTitle = 'Loading...'),
        onPageFinished: (url) {
          setState(() {
            pageTitle = url;
            progressVal = 0;
          });
        },
        onNavigationRequest: (request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //           begin: Alignment.topCenter,
      //           end: Alignment.bottomCenter,
      //           colors: <Color>[Colors.orange, Colors.red]),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(pageTitle),
            ),
            if (progressVal > 0 && progressVal < 1)
              LinearProgressIndicator(
                value: progressVal,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.red,
                ),
                //backgroundColor: Colors.grey,
              ),
            Expanded(
              child: WebViewWidget(
                controller: _controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // IconButton(
                //   onPressed: () async {
                //     if (await _controller.canGoBack()) {
                //       _controller.goBack();
                //     }
                //   },
                //   icon: const Icon(Icons.arrow_back),
                // ),
                IconButton(
                  onPressed: () => _controller.goBack(),
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () => _controller.goForward(),
                  icon: const Icon(Icons.arrow_forward),
                ),
                IconButton(
                  onPressed: () => _controller.reload(),
                  icon: const Icon(Icons.refresh),
                ),
                IconButton(
                  onPressed: () => _controller.clearCache(),
                  icon: const Icon(Icons.delete),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
