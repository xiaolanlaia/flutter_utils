import 'package:flutter/material.dart';

import 'BaseLifeDialog.dart';

/// 
/// @Description 
/// @Author WuJianFeng
/// @Date 2024/3/22 13:54
///
///  DialogController.instance.show(
///  context,
///  dialogContent(progressValue.value),
///  (dialogState){
///  });
///
class DialogController {
  final List<GlobalKey<BaseLifeDialogState>> _widgetKeys = [];
  Function(bool)? dialogState;

  /// dialog 显隐 回调
  void onListenDialogToggle(bool isShow, GlobalKey<BaseLifeDialogState> key) {
    if(dialogState != null){
      dialogState!(isShow);
    }
    if (isShow) {
      //dialog显示

      //关闭之前的其他弹窗
      for (var element in _widgetKeys) {
        element.currentState?.closeSelf();
      }
      _widgetKeys.add(key);

    } else {
      //dialog消失
      if (_widgetKeys.contains(key)) {
        _widgetKeys.remove(key);
      }
    }
  }

  //提供外部调用，showDialog
  show(BuildContext context, Widget child, Function(bool) dialogState) {
    this.dialogState = dialogState;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: BaseLifeDialog(
            key: GlobalKey<BaseLifeDialogState>(),
            callback: onListenDialogToggle,
            child: child,
          ),
        );
      },
    );
  }

  hide(BuildContext context){
    Navigator.of(context).pop();
  }

  ///单例实现
  DialogController._interval();
  static final DialogController _instance = DialogController._interval();
  static DialogController get instance => _instance;

  factory DialogController() => _instance;
}

 
 