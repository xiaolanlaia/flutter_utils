import 'package:flutter/material.dart';
import 'package:flutter_utils/ui/provider/page_provider_second.dart';
import 'package:provider/provider.dart';

import '../../provider/CounterModel.dart';
import 'page_provider_goods.dart';

class PageProviderFirst extends StatelessWidget {
  const PageProviderFirst({super.key});

  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<int>(context).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Center(
                  child: Text(
                    'Value: ${_counter.value}',
                    style: TextStyle(fontSize: textSize),
                  ),
                ),
              )),
          Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageProviderSecond()));
                  },
                  child: Container(
                    color: Colors.grey,
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(20.0),
                    child: Text('SecondPage', style: TextStyle(fontSize: 24),),
                  ),
                ),
              )),
          Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageProviderGoodsList()));
                  },
                  child: Container(
                    color: Colors.grey,
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(20.0),
                    child: Text('Goods', style: TextStyle(fontSize: 24),),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
