import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bean/goods_entity.dart';
import '../../provider/GoodsListProvider.dart';

class PageProviderGoodsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoodsList Page'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => GoodsListProvider(),
        child: Selector<GoodsListProvider, GoodsListProvider>(
          shouldRebuild: (pre, next) => false,
          selector: (context, provider) => provider,
          builder: (context, provider, child) {
            return ListView.builder(
              itemCount: provider.total,
              itemBuilder: (context, index) {
                return Selector<GoodsListProvider, GoodsEntity>(
                  selector: (context, provider) => provider.goodsList[index],
                  builder: (context, data, child) {
                    print(('No.${index + 1} rebuild'));
                    return  ListTile(
                      title: Text(data.goodsName!),
                      trailing: GestureDetector(
                        onTap: () => provider.collect(index),
                        child: Icon(data.isCollection! ? Icons.star : Icons.star_border),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}



