import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:talkjs_app/talk_script.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  HelpScreenState createState() {
    return HelpScreenState();
  }
}

class HelpScreenState extends State<HelpScreen> {
  late InAppWebViewController _webViewController;

  Future<String> localLoader() async {
    return await rootBundle.loadString('assets/test.html');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: localLoader(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        child: InAppWebView(
                          initialFile: "assets/test.html",
                          initialOptions: InAppWebViewGroupOptions(
                            crossPlatform: InAppWebViewOptions(
                              preferredContentMode: UserPreferredContentMode.DESKTOP,
                            )
                          ),
                          onWebViewCreated: (InAppWebViewController controller) {
                            _webViewController = controller;
                          },
                          onLoadStop: (controller, url) async {
                            await controller.evaluateJavascript(
                                source: jsInit);
                          },
                        ),
                      ),
                    );
                  }
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}

  // _loadHtmlFromAssets() async {
  //   String fileText = await rootBundle.loadString('assets/test.html');
  //   _webViewController.loadUrl( Uri.dataFromString(
  //       fileText,
  //       mimeType: 'text/html',
  //       encoding: Encoding.getByName('utf-8')
  //   ).toString());
  // }
