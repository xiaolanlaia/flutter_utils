import 'package:flutter/material.dart';
import 'package:flutter_utils/ui/pageView/page_detail_page.dart';

/// PageView 页面
class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  // 当前子项索引
  int currentIndex = 0;
  // 子项集
  late List<Widget> children;
  // 控制器
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    // 初始化子项集合
    children = [
      PageDetails(title: '首页'),
      PageDetails(title: '消息'),
      PageDetails(title: '我的'),
    ];
    // 初始化控制器
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView - ZeroFlutter'),
      ),
      // 这里改为 PageView
      body: PageView(
        // 设置控制器
        controller: _controller,
        // 设置子项集
        children: children,
        // 添加页面滑动改变后，去改变索引变量刷新页面来更新底部导航
        onPageChanged: (value) {
          currentIndex = value;
          setState(() {});
        },
      ),
      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        // 当前页面索引
        currentIndex: currentIndex,
        // 导航子项集
        items: [
          // 导航子项
          BottomNavigationBarItem(
            // 图标
            icon: const Icon(Icons.home),
            // 文字内容
            label: '${children[0]}',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message_rounded),
            label: '${children[1]}',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: '${children[2]}',
          ),
        ],
        onTap: (value) {
          // 点击事件，用于改变当前索引，然后刷新
          currentIndex = value;
          setState(() {});
          // 通过控制器实现跳转页面
          _controller.jumpToPage(currentIndex);
        },
      )
      ,
    );
  }
}
