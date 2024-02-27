import 'package:flutter/material.dart';
import 'package:flutter_utils/ui/pageView/page_view_page.dart';
import 'package:flutter_utils/ui/refresh/page_refresh.dart';
import 'package:flutter_utils/utils/future_utils.dart';
import 'provider/page_provider_first.dart';

const provider = "Provider";
const pageView = "PageView";
const easyRefresh = "EasyRefresh";
const future = "Future";
const pageList = [provider,pageView,easyRefresh,future];

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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageProviderFirst()));
                  break;
                }
                case pageView:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageViewPage()));
                  break;
                }
                case easyRefresh:{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RefreshPage()));
                  break;
                }
                case future:{
                  FutureUtils().testFuture();
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