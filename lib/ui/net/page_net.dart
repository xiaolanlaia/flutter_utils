import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bean/article_data_entity.dart';
import '../../network/XHttp.dart';
import '../../network/api.dart';
import '../../utils/trace_utils.dart';
import '../../utils/res_colors.dart';
import '../../utils/screen_adapter.dart';

/// 
/// @Description 
/// @Author WuJianFeng
/// @Date 2024/3/12 13:44
/// 

class NetPage extends StatefulWidget{
  const NetPage({super.key});

  @override
  State<StatefulWidget> createState() => _NetPageState();
  
}

class _NetPageState extends State<NetPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NetPage")),
      body: Column(
        children: [
          Container(
            color: color_dddddd,
            margin: EdgeInsets.all(Adapt.pt(20)),
            padding: EdgeInsets.all(Adapt.pt(20)),
            child: InkWell(
              onTap: () async {
                Fluttertoast.showToast(msg: "Get请求");

                XHttp.getInstance().get<ArticleDataEntity>("${Api.homePageArticle}1/json").then((value){
                  print("__login-value  code:${value.errorCode}  message:${value.errorMsg}  data:${value.data!.datas[0].adminAdd}");
                  return value;
                }).catchError((err, StackTrace stackTrace) {
                  // DO SOMETHING
                  print("__login-err ${err}");
                  printLog("__login-err-stackTrace", stackTrace);
                });


              },
              child: const Text("Get请求"),
            ),
          )
        ],
      ),
    );
  }
  
}
 
 