import 'package:flutter_utils/generated/json/base/json_field.dart';
import 'package:flutter_utils/generated/json/goods_entity.g.dart';
import 'dart:convert';
export 'package:flutter_utils/generated/json/goods_entity.g.dart';

@JsonSerializable()
class GoodsEntity {
	bool? isCollection = false;
	String? goodsName = '';

	GoodsEntity();

	factory GoodsEntity.fromJson(Map<String, dynamic> json) => $GoodsEntityFromJson(json);

	Map<String, dynamic> toJson() => $GoodsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}