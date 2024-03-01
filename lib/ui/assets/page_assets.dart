import 'package:flutter/material.dart';
import 'package:flutter_utils/utils/res_images.dart';

/// 
/// @Description 
/// @Author WuJianFeng
/// @Date 2024/3/1 11:06
/// 

class PageAssets extends StatefulWidget{
  const PageAssets({super.key});

  @override
  State<StatefulWidget> createState() => _PageAssetsState();
  
}

class _PageAssetsState extends State<PageAssets>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PageAssets")),
      body: ImageUtils.getImg("login_identity.webp"),
    );
  }
  
}
 
 