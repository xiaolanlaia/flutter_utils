import 'package:flutter/material.dart';
import 'package:flutter_utils/provider/CounterModel.dart';
import 'package:flutter_utils/ui/page_home.dart';
import 'package:flutter_utils/utils/constant.dart';
import 'package:flutter_utils/utils/screen_adapter.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';


void main() {
  final counter = CounterModel();
  final textSize = 48;
  // 这种模式不现实状态栏
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // 这种模式显示状态栏
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  // 修改状态栏颜色(只能黑和白)
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);


  setPathUrlStrategy();

  runApp(
    Provider<int>.value(
      //声明数据，能够提供给子组件使用
      value:textSize,
      //提供数据给子组件使用，当数据更新时通知所有订阅者
      child:ChangeNotifierProvider(
          create: (_) => counter,
          child: const MyApp()
      )
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Adapt.initialize(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
