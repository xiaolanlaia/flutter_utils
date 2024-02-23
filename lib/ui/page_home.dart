import 'package:flutter/material.dart';
import 'package:flutter_utils/ui/pageView/page_view_page.dart';

import '../utils/color_utils.dart';
import 'provider/page_provider_first.dart';

const provider = "Provider";
const pageView = "PageView";
const pageList = [provider,pageView];

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
              }
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 10),
              color: Colors.grey,
              child: Text(
                pageList[index],
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
          );
        },
      ),
    );
  }

}