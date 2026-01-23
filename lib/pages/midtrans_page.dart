import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MidtransPage extends StatefulWidget {
  final String? paymentLink;

  const MidtransPage({super.key, this.paymentLink});

  @override
  State<MidtransPage> createState() => _MidtransPageState();
}

class _MidtransPageState extends State<MidtransPage> {
  late final WebViewController controller;
  var isLoading = true;

  @override
  void initState() {
    super.initState();

    final link = widget.paymentLink ?? Get.arguments;
    
    if (link == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('Error', 'No payment link provided');
        Get.back();
      });
      return;
    }

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Midtrans Payment'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}