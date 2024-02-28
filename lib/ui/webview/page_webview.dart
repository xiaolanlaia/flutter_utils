import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///
/// @Description 
/// @Author WuJianFeng
/// @Date 2024/2/28 16:05
/// 

class PageWebView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _PageWebView();

}

class _PageWebView extends State<PageWebView>{
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://juejin.cn'));
    //添加自定义header
    // controller.loadRequest(Uri.parse('https://juejin.cn'),headers: {
    //   "Custom-Name":"IAM17"
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageWebView")),
      body: Stack(
        children: [
          Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: WebViewWidget(controller: controller),
              )
          ),
          Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        //滚动页面
                        var height = await controller.runJavaScriptReturningResult('document.scrollingElement.scrollHeight') as int;
                        //页面向上滚动一半
                        var scrollTo = height ~/ 2;
                        //滚动到绝对位置
                        // controller.scrollTo(0, scrollTo);
                        //滚动到相对位置
                        controller.scrollBy(0, scrollTo);
                      },
                      child: Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        color: Colors.grey,
                        child: Text("Scroll"),
                      ),
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }

}

 
 