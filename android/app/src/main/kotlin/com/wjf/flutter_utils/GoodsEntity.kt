package com.wjf.flutter_utils

/**
 * @Description
 * @Author WuJianFeng
 * @Date 2024/3/12 9:09
 *
 */

data class GoodsEntity(
    var isCollection: Boolean,
    var goodsName: String,
){
    override fun toString(): String {
        return "{\"isCollection\":\"" + isCollection + "\"" +
                ",\"goodsName\":\"" + goodsName + "\"}"
    }
}