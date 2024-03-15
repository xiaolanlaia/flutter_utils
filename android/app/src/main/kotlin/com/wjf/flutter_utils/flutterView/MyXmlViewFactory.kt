package com.wjf.flutter_utils.flutterView

import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/**
 * @Description
 * @Author WuJianFeng
 * @Date 2024/3/15 15:12
 *
 */

class MyXmlViewFactory(val messenger: BinaryMessenger) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return MyXmlView(context, messenger, viewId, args as Map<String, Any>?)
    }

}
