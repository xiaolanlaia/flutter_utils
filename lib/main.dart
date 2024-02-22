import 'package:flutter/material.dart';
import 'package:flutter_utils/provider/CounterModel.dart';
import 'package:flutter_utils/ui/page_home.dart';
import 'package:provider/provider.dart';

void main() {
  final counter = CounterModel();
  final textSize = 48;
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
