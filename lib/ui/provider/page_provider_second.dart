import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/CounterModel.dart';

class PageProviderSecond extends StatelessWidget {
  const PageProviderSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Consumer2<CounterModel,int>(
        builder: (context, CounterModel counter, int textSize, _) => Center(
          child: Text(
            'Value: ${counter.value}',
            style: TextStyle(
              fontSize: textSize.toDouble(),
            ),
          ),
        ),
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          //构建与model无关的部分，当builder多次运行时，child不会重建
          child: child,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
