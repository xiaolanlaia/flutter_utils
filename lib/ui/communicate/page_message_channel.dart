import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_utils/utils/log_utils.dart';

import '../../bean/goods_entity.dart';
import '../../utils/res_colors.dart';
import '../../utils/screen_adapter.dart';

/// 
/// @Description 
/// @Author WuJianFeng
/// @Date 2024/3/8 16:35
/// 

class PageMessageChannel extends StatefulWidget{
  const PageMessageChannel({super.key});

  @override
  State<StatefulWidget> createState() => _PageMessageChannelState();
  
}

class _PageMessageChannelState extends State<PageMessageChannel>{

  late MethodChannel methodChannel;

  late BasicMessageChannel<String> basicMessageChannel;

  late EventChannel _eventChannel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    basicMessageChannel = const BasicMessageChannel<String>("BasicMessageChannel",StringCodec());

    basicMessageChannel.setMessageHandler((message) async {
      print("__BasicMessageChannel 从原生获得数据:$message");
      return "${message}";
    });

    methodChannel = MethodChannel("MethodChannel");

    _eventChannel = const EventChannel("EventChannel");

    _eventChannel.receiveBroadcastStream().listen( (event){
      LogUtils.d("__EventChannel 接收到Android的消息:$event");
    },onDone: (){
      print("__EventChannel 完成");
    },onError: (error){
      print("__EventChannel 失败：$error");
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MessageChannel')),
      body: Column(
        children: [
          /// MethodChannel
          InkWell(
            onTap: () async {
              /// 调用名为androidMethod的原生方法并获得返回值
              String returnValue = await methodChannel.invokeMethod("androidMethod");
              LogUtils.d("__MethodChannel 从原生Android的java方法返回的值是："+returnValue);

              GoodsEntity mGoodsEntity = GoodsEntity.fromJson(jsonDecode(returnValue));
              LogUtils.d("__MethodChannel isCollection:${mGoodsEntity.isCollection} goodsName:${mGoodsEntity.goodsName}");
            },
            child: Container(
              color: color_dddddd,
              padding: EdgeInsets.all(Adapt.pt(20)),
              margin: EdgeInsets.only(left: Adapt.pt(40)),
              child: Text("MethodChannel", style: TextStyle(fontSize: Adapt.pt(40),color: Colors.black)),
            ),
          ),

          /// BasicMessageChannel
          InkWell(
            onTap: () async {

              basicMessageChannel.send("to Android");

            },
            child: Container(
              color: color_dddddd,
              padding: EdgeInsets.all(Adapt.pt(20)),
              margin: EdgeInsets.only(left: Adapt.pt(40)),
              child: Text("BasicMessageChannel", style: TextStyle(fontSize: Adapt.pt(40),color: Colors.black)),
            ),
          )
        ],
      ),
    );
  }
  
}
 
 