import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 
/// @Description 
/// @Author WuJianFeng
/// @Date 2024/3/15 15:15
/// 

class AndroidViewPage extends StatefulWidget{
  const AndroidViewPage({super.key});

  @override
  State<StatefulWidget> createState() => _AndroidViewPageState();
  
}

class _AndroidViewPageState extends State<AndroidViewPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AndroidViewPage")),
      body: Container(
        color: Colors.white,
        child: platformView(),
      ),
    );
  }

  Widget platformView(){
    if(defaultTargetPlatform == TargetPlatform.android){
      return const AndroidView(
        viewType: 'plugins.flutter.io/custom_platform_view',
        creationParams: {'text': 'Flutter传给AndroidTextView的参数'},
        creationParamsCodec: StandardMessageCodec(),
      );
    }else{
      return const Text("null");
    }
  }
  
}
 
 