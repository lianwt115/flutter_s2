import 'package:flutter/material.dart';


class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }

}

class _HomePageState extends State<HomePage>{

  //状态改变就会调用状态机
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Text('HomePage'),
    );
  }
}