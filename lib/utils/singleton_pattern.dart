class SingletonPattern {
  static final SingletonPattern _singletonPattern =
  SingletonPattern._internal();

  ///工厂构造函数
  factory SingletonPattern() {
    return _singletonPattern;
  }

  ///构造函数私有化，防止被误创建
  SingletonPattern._internal();

  void test() {
    print("测试");
  }
}
