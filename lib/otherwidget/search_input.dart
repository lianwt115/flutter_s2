import 'package:flutter/material.dart';
import '../config.dart';

//真正的搜索框

class SearchInput extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return new _SearchInputState ();
  }



}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: FlatButton.icon(
              onPressed: (){
                //后退
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back,color: GlobalConfig.fontColor,size: 16.0),
              label: Text('',style: TextStyle(color:GlobalConfig.fontColor )),

            ),

          ),

        ],

      ),

      //装饰,修饰 背景和shape
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: GlobalConfig.searchBackgroundColor

      ),
    );
  }
}

