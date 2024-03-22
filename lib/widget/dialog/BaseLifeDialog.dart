import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// 
/// @Description 
/// @Author WuJianFeng
/// @Date 2024/3/22 13:45
///

typedef DialogLifeCallback = Function(
    bool show,
    GlobalKey<BaseLifeDialogState>,
    );

class BaseLifeDialog extends StatefulWidget {
  final DialogLifeCallback callback;
  final Widget child;
  GlobalKey<BaseLifeDialogState> dialogKey = GlobalKey<BaseLifeDialogState>();

  BaseLifeDialog(
      {
        super.key,
        required this.callback,
        required this.child,
      });

  @override
  BaseLifeDialogState createState() => BaseLifeDialogState();
}

class BaseLifeDialogState extends State<BaseLifeDialog> {
  //flutter调度阶段是否为 build/layout/paint
  bool get isPersistentCallbacks =>
      SchedulerBinding.instance.schedulerPhase ==
          SchedulerPhase.persistentCallbacks;

  @override
  void initState() {
    super.initState();
    if (!mounted) return;
    if (isPersistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        //回调告知 dialog 已显示
        _noticeLife(true);
      });
    } else {
      //回调告知 dialog 已显示
      _noticeLife(true);
    }
  }

  @override
  void dispose() {
    //回调告知 dialog 已消失
    _noticeLife(false);
    super.dispose();
  }

  void _noticeLife(bool isShow) {
    widget.callback(isShow, widget.dialogKey);
  }

  ///提供关闭自己的方法
  void closeSelf() {
    if (isPersistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _closeSelf();
      });
    } else {
      _closeSelf();
    }
  }

  void _closeSelf() {
    Navigator.of(context).removeRoute(ModalRoute.of(context) as Route);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

 
 