import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/future_utils.dart';

///
/// @Description 
/// @Author WuJianFeng
/// @Date 2024/2/28 15:13
/// 

class PageFuture extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _PageFuture();
}

class _PageFuture extends State<PageFuture>{

  Future<String>? _fetchData;

  @override
  void initState() {
    _fetchData = fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageFuture')),
      body: FutureBuilder<String>(
        future: _fetchData,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 当Future还未完成时，显示加载中的UI
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // 当Future发生错误时，显示错误提示的UI
            return Text('Error: ${snapshot.error}');
          } else {
            // 当Future成功完成时，显示数据
            return InkWell(
              onTap: (){
                FutureUtils().testFuture();
              },
              child: Text('TestFuture: ${snapshot.data}'),
            );
          }

        },
      ),
    );
  }


  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    // throw Exception("load error");
    // 模拟异步操作，延迟2秒后返回数据
    return "Hello, World!";
  }

}
 
 