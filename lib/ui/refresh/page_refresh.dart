import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class RefreshPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _RefreshPageState();

}

class _RefreshPageState extends State<RefreshPage> with AutomaticKeepAliveClientMixin{

  final EasyRefreshController _refreshController = EasyRefreshController(
      controlFinishRefresh: true, controlFinishLoad: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RefreshPage"),
      ),
      body: EasyRefresh.builder(
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoad: _loadRequest,
          childBuilder: (context, physics) {
            return CustomScrollView(
              physics: physics,
              slivers: [
                SliverList(delegate: SliverChildBuilderDelegate((context, index) {
                  return const Text("data.goodsName");
                }, childCount: 10))
              ],
            );
          }
      ),
    );
  }

  void _onRefresh() async {
    Future.delayed(const Duration(seconds: 1),(){
      _refreshController.finishRefresh();

    });
    // await _refreshRequest();
    // _refreshController.finishRefresh();
    // dataUpdate.refresh();
  }

  void _loadRequest() async {
    Future.delayed(const Duration(seconds: 1),(){
      _refreshController.finishLoad();

    });
    // _pageIndex++;
    // AppResponse<ArticleDataEntity> res = await HttpGo.instance
    //     .get<ArticleDataEntity>("${Api.homePageArticle}$_pageIndex/json");
    // if (res.isSuccessful) {
    //   _articleList.addAll(res.data?.datas ?? List.empty());
    // }
    // _refreshController.finishLoad();
    // dataUpdate.refresh();
  }

  @override
  bool get wantKeepAlive => true;

}