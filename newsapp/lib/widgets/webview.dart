import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewSetting extends StatefulWidget {
  final String? url;
  WebViewSetting({Key? key, this.url}) : super(key: key);

  @override
  _WebViewSettingState createState() => _WebViewSettingState();
}

class _WebViewSettingState extends State<WebViewSetting>
    with WidgetsBindingObserver {
  bool loading = true;
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          minimum: EdgeInsets.all(8),
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            allowsInlineMediaPlayback: true,
            initialUrl: widget.url,
          ),
        ),
      
    );
  }
}
