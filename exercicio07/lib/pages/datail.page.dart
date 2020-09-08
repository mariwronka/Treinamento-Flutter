import 'dart:async';

import 'package:exercicio7start/models/news.model.dart';
import 'package:exercicio7start/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPageArgs {
  final News news;

  DetailPageArgs({this.news});
}

class DetailPage extends StatefulWidget {
  static const route = '/detail';
  final DetailPageArgs args;

  const DetailPage(this.args);

  @override
  _DetailPageState createState() => _DetailPageState(args.news.url);
}

class _DetailPageState extends State<DetailPage> {
  var _url;
  final _key = UniqueKey();
  bool _isLoadingPage;

  Completer<WebViewController> _controller = Completer<WebViewController>();

  _DetailPageState(this._url);

  @override
  void initState() {
    super.initState();
    _isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: Text(
            widget.args.news.author,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: ColorUtils.toolbar,
      ),
      body: Container(
        color: ColorUtils.backgroudPages,
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            new WebView(
              key: _key,
              initialUrl: _url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (webViewCreate) {
                _controller.complete(webViewCreate);
              },
              onPageStarted: (value) {
                Future.delayed(const Duration(milliseconds: 1000), () {
                  setState(() {
                    _isLoadingPage = false;
                  });
                });
              },
            ),
            _isLoadingPage
                ? Container(
                    alignment: FractionalOffset.center,
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    color: Colors.transparent,
                  ),
          ],
        ),
      ),
    );
  }
}
