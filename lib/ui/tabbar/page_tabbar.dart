import 'package:flutter/material.dart';
/// 
/// @Description 
/// @Author WuJianFeng
/// @Date 2024/2/29 9:55
/// 


class PageTabBar extends StatefulWidget {
  const PageTabBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabBarState();
}

class _TabBarState extends State<PageTabBar>with SingleTickerProviderStateMixin {
  List<String> tabs =['头条','新车','导购','小视频','改装赛事'];
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBarView',textAlign: TextAlign.center,),
        //若不使用PreferredSize，则TabBar背景色与顶部一致，且无法更改
        bottom:PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Material(
            color: Colors.blue,
            child: TabBar(
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                labelColor: Colors.black,
                indicatorSize:TabBarIndicatorSize.label,
                indicator:const UnderlineTabIndicator(),
                controller: tabController,
                tabs: tabs.map((e){
                  return Tab(text: e,);
                }).toList()),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child:TabBarView(
                controller: tabController,
                children: tabs.map((e){
                  return Center(child: Text(e,style: TextStyle(fontSize: 50),),);
                }).toList()),)

        ],),
    );
  }
}

 
 