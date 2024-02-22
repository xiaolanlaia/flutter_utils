import 'package:flutter/cupertino.dart';
import 'package:flutter_utils/bean/goods_entity.dart';

class GoodsListProvider with ChangeNotifier {
  final List<GoodsEntity> _goodsList = List.generate(10, (index) {
    var goodsEntity = GoodsEntity();
    goodsEntity.isCollection = false;
    goodsEntity.goodsName = 'Goods No. $index';
    return goodsEntity;
  });

  get goodsList => _goodsList;

  get total => _goodsList.length;

  collect(int index) {
    var good = _goodsList[index];
    var goodsEntity = GoodsEntity();
    goodsEntity.isCollection = !good.isCollection!;
    goodsEntity.goodsName = good.goodsName;
    _goodsList[index] = goodsEntity;
    notifyListeners();
  }
}
