import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GayInfoScreen extends StatefulWidget {
  final String gayInfoScreen;
  const GayInfoScreen({super.key, required this.gayInfoScreen});

  @override
  State<GayInfoScreen> createState() => _GayInfoScreenState();
}

class _GayInfoScreenState extends State<GayInfoScreen> {
  late WebViewController controllerW;

  @override
  void initState() {
    String llllWGay = '';
    if (widget.gayInfoScreen == 'Privacy Policy') {
      llllWGay =
          'https://docs.google.com';
    } else if (widget.gayInfoScreen == 'Terms of Use') {
      llllWGay =
          'https://docs.google.com';
    } else {
      llllWGay = 'https://sites.google.com';
    }

    controllerW = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(llllWGay));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.gayInfoScreen,
          style: TextStyle(
            fontFamily: 'Popin',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(left: 20),
            height: 24,
            width: 24,
            alignment: Alignment.center,
            child: Image.asset(
              'gay_assets/back.png',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(8, 17, 32, 1),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(31).copyWith(bottom: 13),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(23),
                    child: WebViewWidget(
                      controller: controllerW,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
