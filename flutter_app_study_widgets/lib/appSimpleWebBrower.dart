import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AWebBrower extends StatefulWidget {
  String? _webUrl;

  AWebBrower(this._webUrl);

  @override
  _AWebBrowerState createState() => _AWebBrowerState();
}

class _AWebBrowerState extends State<AWebBrower> {
  @override
  Widget build(BuildContext context) {

    String webUrl = this.widget._webUrl ?? "https://www.baidu.com";

    WebViewController _webViewController;

    WebView _webView = WebView(
      onWebViewCreated: (webController){
        _webViewController = webController;
      },
      initialUrl: webUrl,
      onPageFinished: (string) {
      },
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
