import 'package:flutter_utils/utils/log_utils.dart';

///
class FutureUtils {
  void testFuture() {
    LogUtils.d("__future:---");
    var result = _fetchBookId();
    result
        .catchError((e){
          LogUtils.d("__future-e1:$e");
        })
        .then((result) {
          _fetchBookDetail(result);
        })
        .catchError((e){
          LogUtils.d("__future-e2:$e");
        });
  }

  Future<int> _fetchBookId() async {
    //request book id
    return 1;
  }

  _fetchBookDetail(int result) {
    //get bookId then request book detail
    LogUtils.d("__future:$result");
  }
}
