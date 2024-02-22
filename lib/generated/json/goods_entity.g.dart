import 'package:flutter_utils/generated/json/base/json_convert_content.dart';
import 'package:flutter_utils/bean/goods_entity.dart';

GoodsEntity $GoodsEntityFromJson(Map<String, dynamic> json) {
  final GoodsEntity goodsEntity = GoodsEntity();
  final bool? isCollection = jsonConvert.convert<bool>(json['isCollection']);
  if (isCollection != null) {
    goodsEntity.isCollection = isCollection;
  }
  final String? goodsName = jsonConvert.convert<String>(json['goodsName']);
  if (goodsName != null) {
    goodsEntity.goodsName = goodsName;
  }
  return goodsEntity;
}

Map<String, dynamic> $GoodsEntityToJson(GoodsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['isCollection'] = entity.isCollection;
  data['goodsName'] = entity.goodsName;
  return data;
}

extension GoodsEntityExtension on GoodsEntity {
  GoodsEntity copyWith({
    bool? isCollection,
    String? goodsName,
  }) {
    return GoodsEntity()
      ..isCollection = isCollection ?? this.isCollection
      ..goodsName = goodsName ?? this.goodsName;
  }
}