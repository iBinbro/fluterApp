import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';

class AWebBrower extends StatefulWidget {
  String? _webUrl;

  AWebBrower(this._webUrl);

  @override
  _AWebBrowerState createState() => _AWebBrowerState();
}

class _AWebBrowerState extends State<AWebBrower> {
  @override
  Widget build(BuildContext context) {
    String webUrl =
        this.widget._webUrl ?? "https://zhuanlan.zhihu.com/p/103177511";

    WebViewController _webViewController;

    final String contentBase64 =
    base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));

    WebView _webView = WebView(
      onWebViewCreated: (webController) {
        _webViewController = webController;

        // Future.delayed(Duration(seconds: 3), () async {
        //   final String contentBase64 =
        //       base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));
        //   await _webViewController
        //       .loadUrl('data:text/html;base64,$contentBase64');
        // });
      },
      initialUrl: 'data:text/html;base64,$contentBase64',
      onPageFinished: (string) {},
      onPageStarted: (string) {},
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("简单的webview加载h5"),
      ),
      body: _webView,
    );
  }
}
