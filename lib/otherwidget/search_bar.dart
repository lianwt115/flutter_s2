import 'package:flutter/material.dart';
import '../config.dart';


class SearchBar extends StatelessWidget{

  final String leftContent ;
  final String rightContent ;
  final Function click ;

  //封装文字描述和点击
  SearchBar({@required this.leftContent,@required this.rightContent,this.click});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton.icon(
                onPressed: (){
                  if(click != null)
                    click(true);
                },
                icon: Icon(Icons.search,color: GlobalConfig.fontColor,size: 16.0),
                label: Text(leftContent,style: TextStyle(color:GlobalConfig.fontColor )),

            ),

          ),
          //一条竖线
          Container(
            decoration: BoxDecoration(
              //边框
                border: BorderDirectional(
                  start: BorderSide(color: GlobalConfig.fontColor,width: 1.0)
                ),

            ),
            width: 1.0,
            height: 14.0,

          ),

          Container(

            child: FlatButton.icon(
              onPressed: (){
                if(click != null)
                  click(false);
              },
              icon: Icon(Icons.border_color,color: GlobalConfig.fontColor,size: 16.0),
              label: Text(rightContent,style: TextStyle(color:GlobalConfig.fontColor )),

            ),

          )

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

