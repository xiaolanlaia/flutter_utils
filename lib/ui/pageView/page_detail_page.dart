import 'package:flutter/material.dart';

/// 页面详情
class PageDetails extends StatefulWidget {
  const PageDetails({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> with AutomaticKeepAliveClientMixin  {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // 这里的打印可以记录一下，后面会用到
    print('PageDetails build title:${widget.title}');
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          count += 1;
          setState(() {});
        },
        child: Center(
          child: Text('${widget.title} count:$count'),
        ),
      ),
    );
  }

  //设为true，保持页面状态
  @override
  bool get wantKeepAlive => true;
}
