import 'package:flutter/material.dart';
import 'package:flutter_utils/ui/pageView/page_view_page.dart';
import 'package:flutter_utils/ui/refresh/page_refresh.dart';
import 'package:flutter_utils/ui/tabbar/page_tabbar.dart';
import 'package:flutter_utils/ui/webview/page_webview.dart';
import 'androidView/page_android_view.dart';
import 'assets/page_assets.dart';
import 'communicate/page_message_channel.dart';
import 'future/page_future.dart';
import 'net/page_net.dart';
import 'provider/page_provider_first.dart';

const provider        = "Provider";
const pageView        = "PageView";
const easyRefresh     = "EasyRefresh";
const future          = "Future";
const webView         = "WebView";
const pageTabBar      = "PageTabBar";
const assets          = "Assets";
const messageChannel  = "MessageChannel";
const netPage         = "NetPage";
const androidViewPage = "AndroidViewPage";
const pageList = [provider,pageView,easyRefresh,future,webView,pageTabBar,assets,messageChannel,netPage,androidViewPage];

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pageList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              switch(pageList[index]){
                case provider:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageProviderFirst()));
                  break;
                }
                case pageView:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageViewPage()));
                  break;
                }
                case easyRefresh:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RefreshPage()));
                  break;
                }
                case future:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageFuture()));
                  break;
                }
                case webView:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageWebView()));
                  break;
                }
                case pageTabBar:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageTabBar()));
                  break;
                }
                case assets:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageAssets()));
                  break;
                }
                case messageChannel:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PageMessageChannel()));
                  break;
                }
                case netPage:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NetPage()));
                  break;
                }
                case androidViewPage:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AndroidViewPage()));
                  break;
                }
              }
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 10),
              color: Colors.grey,
              child: Text(
                pageList[index],
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
          );
        },
      ),
    );
  }

}