package com.wjf.flutter_utils.flutterView

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.TextView
import com.wjf.flutter_utils.R
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView

/**
 * @Description
 * @Author WuJianFeng
 * @Date 2024/3/15 15:07
 *
 */

/**
 * messenger：用于消息传递，后面介绍 Flutter 与 原生通信时用到此参数。
 * viewId：View 生成时会分配一个唯一 ID。
 * args：Flutter 传递的初始化参数。
 */
class MyXmlView(context: Context, messenger: BinaryMessenger, viewId: Int, args: Map<String, Any>?): PlatformView {

    var myView: View

    init {
        myView = LayoutInflater.from(context.applicationContext).inflate(R.layout.xml_view,null)
        args?.also {
            val tv = myView.findViewById<TextView>(R.id.tv_view)
            tv.text = it["text"] as String
        }
    }

    /**
     * 返回要嵌入 Flutter 层次结构的Android View
     */
    override fun getView(): View {
        return myView
    }

    /**
     * 释放此View时调用，此方法调用后 View 不可用，
     * 此方法需要清除所有对象引用，否则会造成内存泄漏。
     */
    override fun dispose() {
        
    }
}