import 'package:flutter/material.dart';
import 'index/index.dart';

//整个应用程序的入口文件
void main() {
  runApp(App());
}

//用无状态组件包裹
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Index();
  }

}