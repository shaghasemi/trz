import 'package:flutter/material.dart';
import 'package:hamdars/core/utils/styling/color.dart';
import 'package:webview_universal/webview_universal.dart';

class GoogleScreen extends StatefulWidget {
  final String? content;

  const GoogleScreen({super.key, this.content});

  @override
  GoogleScreenState createState() => GoogleScreenState();
}

class GoogleScreenState extends State<GoogleScreen> {
  late WebViewController controller;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    controller = WebViewController();
    await controller.init(
      context: context,
      uri: Uri.parse("https://google.com/search?q=${widget.content}"),
      setState: (void Function() fn) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Google Search'),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: colorBlack0,
          size: 22,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget body() {
    return WebView(
      controller: controller,
    );
  }
}
