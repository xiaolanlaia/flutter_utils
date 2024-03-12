package com.wjf.flutter_utils

import android.os.Bundle
import android.os.Handler
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StringCodec

class MainActivity: FlutterActivity() {
    var eventSink: EventChannel.EventSink? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setMethodChannel()
        setBasicMessageChannel()
        setEventChannel()
    }

    private fun setEventChannel(){
        val eventChannel  = EventChannel(flutterEngine!!.dartExecutor.binaryMessenger,"EventChannel")
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
            }

            override fun onCancel(arguments: Any?) {
            }

        })
        Handler(mainLooper).postDelayed({
            Log.d("__EventChannel", "android send message${eventSink == null}")
            eventSink?.success("Hello Flutter")
        },10000)


    }

    private fun setBasicMessageChannel(){
        val messageChannel  = BasicMessageChannel(flutterEngine!!.dartExecutor.binaryMessenger, "BasicMessageChannel", StringCodec.INSTANCE)

        messageChannel.setMessageHandler { message, reply ->
            Log.d("flutter", "__BasicMessageChannel 从Flutter获得数据 :$message")
            messageChannel.send("to flutter")

        }

    }

    private fun setMethodChannel(){
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, "MethodChannel").setMethodCallHandler { methodCall, result ->
            if (methodCall.method != null) {
                //方法被Flutter调用
                if (methodCall.method.equals("androidMethod")){
                    //给Flutter返回值
                    result.success(toFlutter())
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun toFlutter(): String {
        return GoodsEntity(true,"GoodsEntity").toString()
    }



}
