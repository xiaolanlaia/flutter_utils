package com.wjf.flutter_utils.flutterView

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.PluginRegistry

/**
 * @Description
 * @Author WuJianFeng
 * @Date 2024/3/15 15:12
 *
 */

class MyPlugin : FlutterPlugin {

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        val messenger: BinaryMessenger = binding.binaryMessenger
        binding
            .platformViewRegistry
            //plugins.flutter.io/custom_platform_view 在Flutter中需要保持一致
            .registerViewFactory("plugins.flutter.io/custom_platform_view", MyXmlViewFactory(messenger))
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: PluginRegistry.Registrar) {
            registrar
                .platformViewRegistry()
                .registerViewFactory(
                    "plugins.flutter.io/custom_platform_view",
                    MyXmlViewFactory(registrar.messenger()))
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }
}
